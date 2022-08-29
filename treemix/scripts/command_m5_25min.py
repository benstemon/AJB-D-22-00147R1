import ipyrad.analysis as ipa
import toytree
import toyplot

# the path to HDF5 formatted snps file
data = "/fs/project/wolfe.205/stone.494/project_davidsonii_x_fruticosus/treemix_focal_outfiles/treemix_focal.snps.hdf5"

# group individuals into populations
imap = {
    "abietinus": ["abietinus_16_459"],
    "davidsonii": ["davidsonii_0_013", "davidsonii_96_0177", "davidsonii_BWS_115_3", "davidsonii_BWS_115_8", "davidsonii_BWS_116.10_18.0846", "davidsonii_BWS_116_7", "davidsonii_BWS_117_1", "davidsonii_BWS_117_4", "davidsonii_BWS_23_11", "davidsonii_BWS_23_4", "davidsonii_BWS_23_7", "davidsonii_BWS_25_1", "davidsonii_BWS_25_6", "davidsonii_BWS_27_12", "davidsonii_BWS_27_2", "davidsonii_BWS_27_7", "davidsonii_BWS_87_1", "davidsonii_BWS_87_2", "davidsonii_BWS_95_10", "davidsonii_BWS_95_5", "davidsonii_OSTL_1", "davidsonii_OSTL_2", "davidsonii_UWTL_11", "davidsonii_UWTL_13_SHL_19.59", "davidsonii_UWTL_3", "davidsonii_UWTL_4"],
    "fruticosus": ["P_fruticosus_Pop2_17.0622", "P_fruticosus_Pop2_17.0623", "P_fruticosus_Pop2_17.0626", "P_fruticosus_Pop2_17.0631", "P_fruticosus_Pop2_17.0632", "P_fruticosus_Pop2_17.0633", "P_fruticosus_Pop3_17.0645", "P_fruticosus_Pop3_17.0646", "P_fruticosus_Pop3_17.0647", "P_fruticosus_Pop3_17.0648", "P_fruticosus_Pop3_17.0649", "P_fruticosus_Pop3_17.065", "P_fruticosus_Pop3_17.0651", "P_fruticosus_Pop3_17.0652", "P_fruticosus_Pop4_17.0697", "P_fruticosus_Pop4_17.0699", "P_fruticosus_Pop4_17.0702", "fruticosus_96_0023", "fruticosus_96_0149", "fruticosus_BWS_102_6", "fruticosus_BWS_102_8", "fruticosus_BWS_106_1", "fruticosus_BWS_106_2", "fruticosus_BWS_107_4", "fruticosus_BWS_107_7", "fruticosus_BWS_54_3", "fruticosus_BWS_55_1", "fruticosus_BWS_55_2", "fruticosus_BWS_56_4", "fruticosus_BWS_56_5", "fruticosus_BWS_58_6", "fruticosus_BWS_58_9", "fruticosus_BWS_59_2", "fruticosus_BWS_59_7", "fruticosus_BWS_60_4", "fruticosus_BWS_60_6", "fruticosus_BWS_62_1", "fruticosus_BWS_62_8", "fruticosus_BWS_63_2", "fruticosus_BWS_63_3", "fruticosus_BWS_69_4", "fruticosus_BWS_69_5", "fruticosus_BWS_7_15", "fruticosus_BWS_7_17", "fruticosus_BWS_7_24", "fruticosus_BWS_93_6", "fruticosus_OSTL_11", "fruticosus_OSTL_12", "fruticosus_OSTL_13", "fruticosus_OSTL_14", "fruticosus_OSTL_15", "fruticosus_OSTL_16", "fruticosus_OSTL_9"],
    "menziesii": ["menziesii_BWS_103_2", "menziesii_BWS_103_9", "menziesii_BWS_104_5", "menziesii_OSTL_4", "menziesii_UWTL_1", "menziesii_UWTL_2", "menziesii_UWTL_22_SHL_19.68", "menziesii_UWTL_5", "menziesii_UWTL_7", "menziesii_UWTL_8"],
    "praeteritus": ["praeteritus_2_0471", "praeteritus_96_0049", "praeteritus_96_0105", "praeteritus_BWS_118_5", "praeteritus_BWS_118_9", "praeteritus_BWS_119_6", "praeteritus_BWS_119_9", "praeteritus_BWS_120_2", "praeteritus_BWS_120_3", "praeteritus_BWS_121_3", "praeteritus_BWS_121_4", "praeteritus_BWS_122_1", "praeteritus_BWS_122_3"],
    "scouleri": ["scouleri_OSTL_17", "scouleri_OSTL_19", "scouleri_OSTL_20", "scouleri_OSTL_21", "scouleri_OSTL_22", "P_fruticosus_Pop7_18.0822", "P_fruticosus_Pop7_18.0825", "P_fruticosus_Popnew1_19.008", "P_fruticosus_Popnew2_19.0081", "P_fruticosus_Popnew2_19.0082"],
    "serratus": ["serratus_2_047", "P_fruticosus_Pop8_18.0826", "P_fruticosus_Pop8_18.0827"],
}

# minimum % of samples that must be present in each SNP from each group
minmap = {i: 0.25 for i in imap}


#make treemix object
tmx1 = ipa.treemix(
    workdir="/fs/project/wolfe.205/stone.494/project_davidsonii_x_fruticosus/analyses_treemix/m5/rep1",
    data=data,
    imap=imap,
    minmap=minmap,
    root="abietinus",
    global_=True,
    seed=8028,
    m=5
)

tmx2 = ipa.treemix(
    workdir="/fs/project/wolfe.205/stone.494/project_davidsonii_x_fruticosus/analyses_treemix/m5/rep2",
    data=data,
    imap=imap,
    minmap=minmap,
    root="abietinus",
    global_=True,
    seed=32057,
    m=5
)

tmx3 = ipa.treemix(
    workdir="/fs/project/wolfe.205/stone.494/project_davidsonii_x_fruticosus/analyses_treemix/m5/rep3",
    data=data,
    imap=imap,
    minmap=minmap,
    root="abietinus",
    global_=True,
    seed=51899,
    m=5
)

tmx4 = ipa.treemix(
    workdir="/fs/project/wolfe.205/stone.494/project_davidsonii_x_fruticosus/analyses_treemix/m5/rep4",
    data=data,
    imap=imap,
    minmap=minmap,
    root="abietinus",
    global_=True,
    seed=23595,
    m=5
)

tmx5 = ipa.treemix(
    workdir="/fs/project/wolfe.205/stone.494/project_davidsonii_x_fruticosus/analyses_treemix/m5/rep5",
    data=data,
    imap=imap,
    minmap=minmap,
    root="abietinus",
    global_=True,
    seed=37960,
    m=5
)

tmx1.run()
tmx2.run()
tmx3.run()
tmx4.run()
tmx5.run()



likvals = {}
likvals[1,2,3,4,5] = tmx1.results.llik,tmx2.results.llik,tmx3.results.llik,tmx4.results.llik,tmx5.results.llik
with open('likvals_m5.txt', 'w') as file:
    file.writelines(str(likvals[1,2,3,4,5]))
    file.close()

quit()
