Content-Type: multipart/mixed; boundary="===============4532311409635061593=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 25/28] cxl/hdm: Commit decoder state to hardware
Date: Sun, 17 Jul 2022 05:58:22 +0800
Message-ID: <202207170530.EyDKrQwG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4532311409635061593==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <165784338418.1758207.14659830845389904356.stgit@dwillia2-xf=
h.jf.intel.com>
References: <165784338418.1758207.14659830845389904356.stgit@dwillia2-xfh=
.jf.intel.com>
TO: Dan Williams <dan.j.williams@intel.com>

Hi Dan,

I love your patch! Perhaps something to improve:

[auto build test WARNING on b060edfd8cdd52bc8648392500bf152a8dd6d4c5]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Williams/CXL-PME=
M-Region-Provisioning/20220715-080748
base:   b060edfd8cdd52bc8648392500bf152a8dd6d4c5
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
717/202207170530.EyDKrQwG-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/cxl/core/hdm.c:475 cxld_set_interleave() error: uninitialized symbo=
l 'eig'.
drivers/cxl/core/hdm.c:476 cxld_set_interleave() error: uninitialized symbo=
l 'eiw'.

Old smatch warnings:
drivers/cxl/core/hdm.c:344 cxl_dpa_free() error: uninitialized symbol 'rc'.
drivers/cxl/core/hdm.c:461 cxl_dpa_alloc() error: uninitialized symbol 'rc'.

vim +/eig +475 drivers/cxl/core/hdm.c

5ccc075e8e0da0 Dan Williams 2022-07-14  466  =

4eeba6d677001b Dan Williams 2022-07-14  467  static void cxld_set_interleav=
e(struct cxl_decoder *cxld, u32 *ctrl)
4eeba6d677001b Dan Williams 2022-07-14  468  {
4eeba6d677001b Dan Williams 2022-07-14  469  	u16 eig;
4eeba6d677001b Dan Williams 2022-07-14  470  	u8 eiw;
4eeba6d677001b Dan Williams 2022-07-14  471  =

4eeba6d677001b Dan Williams 2022-07-14  472  	ways_to_cxl(cxld->interleave_=
ways, &eiw);
4eeba6d677001b Dan Williams 2022-07-14  473  	granularity_to_cxl(cxld->inte=
rleave_granularity, &eig);
4eeba6d677001b Dan Williams 2022-07-14  474  =

4eeba6d677001b Dan Williams 2022-07-14 @475  	u32p_replace_bits(ctrl, eig, =
CXL_HDM_DECODER0_CTRL_IG_MASK);
4eeba6d677001b Dan Williams 2022-07-14 @476  	u32p_replace_bits(ctrl, eiw, =
CXL_HDM_DECODER0_CTRL_IW_MASK);
4eeba6d677001b Dan Williams 2022-07-14  477  	*ctrl |=3D CXL_HDM_DECODER0_C=
TRL_COMMIT;
4eeba6d677001b Dan Williams 2022-07-14  478  }
4eeba6d677001b Dan Williams 2022-07-14  479  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4532311409635061593==--

