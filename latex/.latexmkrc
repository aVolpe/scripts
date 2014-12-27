$pdf_mode = 1;

add_cus_dep('glo', 'gls', 0, 'makeglo2gls');
sub makeglo2gls {
    system("makeindex -s '$_[0]'.ist -t '$_[0]'.glg -o '$_[0]'.gls '$_[0]'.glo");
}


@generated_exts = qw(aux idx ind lof lot out toc acn acr alg glg glo gls ist loa run.xml fdb_latexmk fls);
%$out_dir = 'target';

