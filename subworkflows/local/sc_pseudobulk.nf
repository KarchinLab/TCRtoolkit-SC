// Include modules

// include {  } from '../../modules/local/module.nf'

workflow SC_PSEUDOBULK {

    take:
    ch_vdj_contigs

    main:
    println('-- Entering SC_PSEUDOBULK subworkflow ...')

    // Quality control
    ch_vdj_contigs = ch_vdj_contigs
        .collect()

    ch_vdj_annotations = ch_vdj_contigs
        .map{ file -> file.findAll { it.toString().endsWith('filtered_contig_annotations.csv') }  }
        .map{ file -> file.parent.parent }
        .collect()
        
    ch_vdj_annotations
        .view()
    
}