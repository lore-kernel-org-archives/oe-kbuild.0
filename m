Content-Type: multipart/mixed; boundary="===============5937976516944811144=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pci/endpoint/functions/pci-epf-vntb.c:907 epf_ntb_mw1_show() warn: potential spectre issue 'ntb->mws_size' [w]
Date: Sun, 21 Aug 2022 18:57:02 +0800
Message-ID: <202208211805.4b8ykdji-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5937976516944811144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Dan Carpenter <error27@gmail.com>
CC: Jon Mason <jdmason@kudzu.us>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   15b3f48a4339e3c16acf18624e2b7f60bc5e9a2c
commit: b8c0aa9b16bb2f4d5966b87fbf1f36f3280e1f60 NTB: EPF: Tidy up some bou=
nds checks
date:   12 days ago
:::::: branch date: 13 hours ago
:::::: commit date: 12 days ago
config: arm64-randconfig-m031-20220821 (https://download.01.org/0day-ci/arc=
hive/20220821/202208211805.4b8ykdji-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/pci/endpoint/functions/pci-epf-vntb.c:907 epf_ntb_mw1_show() warn: =
potential spectre issue 'ntb->mws_size' [w]
drivers/pci/endpoint/functions/pci-epf-vntb.c:909 epf_ntb_mw2_show() warn: =
potential spectre issue 'ntb->mws_size' [w]
drivers/pci/endpoint/functions/pci-epf-vntb.c:911 epf_ntb_mw3_show() warn: =
potential spectre issue 'ntb->mws_size' [w]
drivers/pci/endpoint/functions/pci-epf-vntb.c:913 epf_ntb_mw4_show() warn: =
potential spectre issue 'ntb->mws_size' [w]

Old smatch warnings:
drivers/pci/endpoint/functions/pci-epf-vntb.c:908 epf_ntb_mw1_store() warn:=
 potential spectre issue 'ntb->mws_size' [w]
drivers/pci/endpoint/functions/pci-epf-vntb.c:910 epf_ntb_mw2_store() warn:=
 potential spectre issue 'ntb->mws_size' [w]
drivers/pci/endpoint/functions/pci-epf-vntb.c:912 epf_ntb_mw3_store() warn:=
 potential spectre issue 'ntb->mws_size' [w]
drivers/pci/endpoint/functions/pci-epf-vntb.c:914 epf_ntb_mw4_store() warn:=
 potential spectre issue 'ntb->mws_size' [w]

vim +907 drivers/pci/endpoint/functions/pci-epf-vntb.c

e35f56bb03304a Frank Li 2022-02-22  895  =

e35f56bb03304a Frank Li 2022-02-22  896  EPF_NTB_R(spad_count)
e35f56bb03304a Frank Li 2022-02-22  897  EPF_NTB_W(spad_count)
e35f56bb03304a Frank Li 2022-02-22  898  EPF_NTB_R(db_count)
e35f56bb03304a Frank Li 2022-02-22  899  EPF_NTB_W(db_count)
e35f56bb03304a Frank Li 2022-02-22  900  EPF_NTB_R(num_mws)
e35f56bb03304a Frank Li 2022-02-22  901  EPF_NTB_R(vbus_number)
e35f56bb03304a Frank Li 2022-02-22  902  EPF_NTB_W(vbus_number)
e35f56bb03304a Frank Li 2022-02-22  903  EPF_NTB_R(vntb_pid)
e35f56bb03304a Frank Li 2022-02-22  904  EPF_NTB_W(vntb_pid)
e35f56bb03304a Frank Li 2022-02-22  905  EPF_NTB_R(vntb_vid)
e35f56bb03304a Frank Li 2022-02-22  906  EPF_NTB_W(vntb_vid)
e35f56bb03304a Frank Li 2022-02-22 @907  EPF_NTB_MW_R(mw1)
e35f56bb03304a Frank Li 2022-02-22  908  EPF_NTB_MW_W(mw1)
e35f56bb03304a Frank Li 2022-02-22 @909  EPF_NTB_MW_R(mw2)
e35f56bb03304a Frank Li 2022-02-22  910  EPF_NTB_MW_W(mw2)
e35f56bb03304a Frank Li 2022-02-22 @911  EPF_NTB_MW_R(mw3)
e35f56bb03304a Frank Li 2022-02-22  912  EPF_NTB_MW_W(mw3)
e35f56bb03304a Frank Li 2022-02-22 @913  EPF_NTB_MW_R(mw4)
e35f56bb03304a Frank Li 2022-02-22  914  EPF_NTB_MW_W(mw4)
e35f56bb03304a Frank Li 2022-02-22  915  =


:::::: The code at line 907 was first introduced by commit
:::::: e35f56bb03304abc92c928b641af41ca372966bb PCI: endpoint: Support NTB =
transfer between RC and EP

:::::: TO: Frank Li <Frank.Li@nxp.com>
:::::: CC: Jon Mason <jdmason@kudzu.us>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5937976516944811144==--

