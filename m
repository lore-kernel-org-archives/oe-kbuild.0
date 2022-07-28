Content-Type: multipart/mixed; boundary="===============5299574689845033901=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 10583/13276] drivers/pci/endpoint/functions/pci-epf-vntb.c:897 epf_ntb_mw1_store() warn: potential spectre issue 'ntb->mws_size' [w]
Date: Thu, 28 Jul 2022 15:32:59 +0800
Message-ID: <202207281539.GTP2G8Jz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5299574689845033901==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Frank Li <Frank.Li@nxp.com>
CC: Jon Mason <jdmason@kudzu.us>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   9250d2f72dc46a808b6aa23bf50dd670f1f52ddc
commit: da51fd247424648b1b4611ad14c091ff0d946681 [10583/13276] NTB: EPF: su=
pport NTB transfer between PCI RC and EP connection
:::::: branch date: 19 hours ago
:::::: commit date: 10 days ago
config: mips-randconfig-m031-20220727 (https://download.01.org/0day-ci/arch=
ive/20220728/202207281539.GTP2G8Jz-lkp(a)intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/pci/endpoint/functions/pci-epf-vntb.c:897 epf_ntb_mw1_store() warn:=
 potential spectre issue 'ntb->mws_size' [w]
drivers/pci/endpoint/functions/pci-epf-vntb.c:899 epf_ntb_mw2_store() warn:=
 potential spectre issue 'ntb->mws_size' [w]
drivers/pci/endpoint/functions/pci-epf-vntb.c:901 epf_ntb_mw3_store() warn:=
 potential spectre issue 'ntb->mws_size' [w]
drivers/pci/endpoint/functions/pci-epf-vntb.c:903 epf_ntb_mw4_store() warn:=
 potential spectre issue 'ntb->mws_size' [w]
drivers/pci/endpoint/functions/pci-epf-vntb.c:1317 epf_ntb_bind() warn: mis=
sing error code 'ret'

vim +897 drivers/pci/endpoint/functions/pci-epf-vntb.c

da51fd24742464 Frank Li 2022-02-14  888  =

da51fd24742464 Frank Li 2022-02-14  889  EPF_NTB_R(spad_count)
da51fd24742464 Frank Li 2022-02-14  890  EPF_NTB_W(spad_count)
da51fd24742464 Frank Li 2022-02-14  891  EPF_NTB_R(db_count)
da51fd24742464 Frank Li 2022-02-14  892  EPF_NTB_W(db_count)
da51fd24742464 Frank Li 2022-02-14  893  EPF_NTB_R(num_mws)
da51fd24742464 Frank Li 2022-02-14  894  EPF_NTB_R(vbus_number)
da51fd24742464 Frank Li 2022-02-14  895  EPF_NTB_W(vbus_number)
da51fd24742464 Frank Li 2022-02-14  896  EPF_NTB_MW_R(mw1)
da51fd24742464 Frank Li 2022-02-14 @897  EPF_NTB_MW_W(mw1)
da51fd24742464 Frank Li 2022-02-14  898  EPF_NTB_MW_R(mw2)
da51fd24742464 Frank Li 2022-02-14 @899  EPF_NTB_MW_W(mw2)
da51fd24742464 Frank Li 2022-02-14  900  EPF_NTB_MW_R(mw3)
da51fd24742464 Frank Li 2022-02-14 @901  EPF_NTB_MW_W(mw3)
da51fd24742464 Frank Li 2022-02-14  902  EPF_NTB_MW_R(mw4)
da51fd24742464 Frank Li 2022-02-14 @903  EPF_NTB_MW_W(mw4)
da51fd24742464 Frank Li 2022-02-14  904  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5299574689845033901==--

