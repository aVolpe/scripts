#!/Users/avolpe/.scripts/iterm/.venv/bin/python
import iterm2


def _setter_name(preset_key: str) -> str:
    return "set_" + preset_key.lower().replace(" ", "_")


async def main(connection):
    app = await iterm2.async_get_app(connection)

    session = app.current_terminal_window.current_tab.current_session
    if not session:
        print("Error: Could not identify the current active session.")
        return

    DARK = "TokyoNight"
    LIGHT = "TokyoNight Day"
    STATE_VAR = "user.tt_theme"

    last = await session.async_get_variable(STATE_VAR)
    if last == "light":
        preset_name = DARK
        new_state = "dark"
    elif last == "dark":
        preset_name = LIGHT
        new_state = "light"
    else:
        app_theme = (await app.async_get_variable("effectiveTheme") or "").lower()
        if "dark" in app_theme:
            preset_name = LIGHT
            new_state = "light"
        else:
            preset_name = DARK
            new_state = "dark"
    print(f"Last: {last!r} -> applying {preset_name}")

    preset = await iterm2.ColorPreset.async_get(connection, preset_name)
    if not preset:
        print(f"Error: preset '{preset_name}' not found.")
        return

    change = iterm2.LocalWriteOnlyProfile()
    for color in preset.values:
        base = _setter_name(color.key)
        applied = False
        for suffix in ("", "_dark", "_light"):
            setter = getattr(change, base + suffix, None)
            if setter is not None:
                setter(color)
                applied = True
        if not applied:
            print(f"Skipping unknown preset key: {color.key}")

    await session.async_set_profile_properties(change)
    await session.async_set_variable(STATE_VAR, new_state)
    print(f"Successfully repainted the current active session (state={new_state})!")


iterm2.run_until_complete(main)
