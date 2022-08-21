Content-Type: multipart/mixed; boundary="===============4662202580442714189=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pci/endpoint/functions/pci-epf-vntb.c:891 epf_ntb_mw1_store() warn: potential spectre issue 'ntb->mws_size' [w]
Date: Sun, 21 Aug 2022 15:43:13 +0800
Message-ID: <202208211553.oqHMwzdj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4662202580442714189==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Frank Li <Frank.Li@nxp.com>
CC: Jon Mason <jdmason@kudzu.us>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   15b3f48a4339e3c16acf18624e2b7f60bc5e9a2c
commit: e35f56bb03304abc92c928b641af41ca372966bb PCI: endpoint: Support NTB=
 transfer between RC and EP
date:   11 days ago
:::::: branch date: 10 hours ago
:::::: commit date: 11 days ago
config: arm64-randconfig-m031-20220821 (https://download.01.org/0day-ci/arc=
hive/20220821/202208211553.oqHMwzdj-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/pci/endpoint/functions/pci-epf-vntb.c:891 epf_ntb_mw1_store() warn:=
 potential spectre issue 'ntb->mws_size' [w]
drivers/pci/endpoint/functions/pci-epf-vntb.c:893 epf_ntb_mw2_store() warn:=
 potential spectre issue 'ntb->mws_size' [w]
drivers/pci/endpoint/functions/pci-epf-vntb.c:895 epf_ntb_mw3_store() warn:=
 potential spectre issue 'ntb->mws_size' [w]
drivers/pci/endpoint/functions/pci-epf-vntb.c:897 epf_ntb_mw4_store() warn:=
 potential spectre issue 'ntb->mws_size' [w]

Old smatch warnings:
drivers/pci/endpoint/functions/pci-epf-vntb.c:1316 epf_ntb_bind() warn: mis=
sing error code 'ret'

vim +891 drivers/pci/endpoint/functions/pci-epf-vntb.c

e35f56bb03304a Frank Li 2022-02-22  878  =

e35f56bb03304a Frank Li 2022-02-22  879  EPF_NTB_R(spad_count)
e35f56bb03304a Frank Li 2022-02-22  880  EPF_NTB_W(spad_count)
e35f56bb03304a Frank Li 2022-02-22  881  EPF_NTB_R(db_count)
e35f56bb03304a Frank Li 2022-02-22  882  EPF_NTB_W(db_count)
e35f56bb03304a Frank Li 2022-02-22  883  EPF_NTB_R(num_mws)
e35f56bb03304a Frank Li 2022-02-22  884  EPF_NTB_R(vbus_number)
e35f56bb03304a Frank Li 2022-02-22  885  EPF_NTB_W(vbus_number)
e35f56bb03304a Frank Li 2022-02-22  886  EPF_NTB_R(vntb_pid)
e35f56bb03304a Frank Li 2022-02-22  887  EPF_NTB_W(vntb_pid)
e35f56bb03304a Frank Li 2022-02-22  888  EPF_NTB_R(vntb_vid)
e35f56bb03304a Frank Li 2022-02-22  889  EPF_NTB_W(vntb_vid)
e35f56bb03304a Frank Li 2022-02-22  890  EPF_NTB_MW_R(mw1)
e35f56bb03304a Frank Li 2022-02-22 @891  EPF_NTB_MW_W(mw1)
e35f56bb03304a Frank Li 2022-02-22  892  EPF_NTB_MW_R(mw2)
e35f56bb03304a Frank Li 2022-02-22 @893  EPF_NTB_MW_W(mw2)
e35f56bb03304a Frank Li 2022-02-22  894  EPF_NTB_MW_R(mw3)
e35f56bb03304a Frank Li 2022-02-22 @895  EPF_NTB_MW_W(mw3)
e35f56bb03304a Frank Li 2022-02-22  896  EPF_NTB_MW_R(mw4)
e35f56bb03304a Frank Li 2022-02-22 @897  EPF_NTB_MW_W(mw4)
e35f56bb03304a Frank Li 2022-02-22  898  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4662202580442714189==--

