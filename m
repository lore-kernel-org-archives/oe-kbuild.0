Content-Type: multipart/mixed; boundary="===============3876295269508514299=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cxl:preview 47/51] drivers/cxl/core/hdm.c:457 cxld_set_interleave() error: uninitialized symbol 'eig'.
Date: Sat, 02 Jul 2022 13:48:48 +0800
Message-ID: <202207021334.QNToLnEY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3876295269508514299==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Alison Schofield <alison.schofield@intel.com>
CC: Vishal Verma <vishal.l.verma@intel.com>
CC: Ira Weiny <ira.weiny@intel.com>
CC: Ben Widawsky <ben.widawsky@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>
TO: Dan Williams <dan.j.williams@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git preview
head:   1985cf58850562e4b960e19d46f0d8f19d6c7cbd
commit: 9ca045c484e85341c26fe26881e528f7624bdaea [47/51] cxl/hdm: Commit de=
coder state to hardware
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
702/202207021334.QNToLnEY-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/cxl/core/hdm.c:457 cxld_set_interleave() error: uninitialized symbo=
l 'eig'.
drivers/cxl/core/hdm.c:458 cxld_set_interleave() error: uninitialized symbo=
l 'eiw'.

vim +/eig +457 drivers/cxl/core/hdm.c

9bf2b58793cb51 Dan Williams 2022-05-23  448  =

9ca045c484e853 Dan Williams 2022-06-08  449  static void cxld_set_interleav=
e(struct cxl_decoder *cxld, u32 *ctrl)
9ca045c484e853 Dan Williams 2022-06-08  450  {
9ca045c484e853 Dan Williams 2022-06-08  451  	u16 eig;
9ca045c484e853 Dan Williams 2022-06-08  452  	u8 eiw;
9ca045c484e853 Dan Williams 2022-06-08  453  =

9ca045c484e853 Dan Williams 2022-06-08  454  	ways_to_cxl(cxld->interleave_=
ways, &eiw);
9ca045c484e853 Dan Williams 2022-06-08  455  	granularity_to_cxl(cxld->inte=
rleave_granularity, &eig);
9ca045c484e853 Dan Williams 2022-06-08  456  =

9ca045c484e853 Dan Williams 2022-06-08 @457  	u32p_replace_bits(ctrl, eig, =
CXL_HDM_DECODER0_CTRL_IG_MASK);
9ca045c484e853 Dan Williams 2022-06-08 @458  	u32p_replace_bits(ctrl, eiw, =
CXL_HDM_DECODER0_CTRL_IW_MASK);
9ca045c484e853 Dan Williams 2022-06-08  459  	*ctrl |=3D CXL_HDM_DECODER0_C=
TRL_COMMIT;
9ca045c484e853 Dan Williams 2022-06-08  460  }
9ca045c484e853 Dan Williams 2022-06-08  461  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3876295269508514299==--

