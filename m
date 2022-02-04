Content-Type: multipart/mixed; boundary="===============5656741164198485124=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v32 06/28] LSM: Use lsmblob in security_audit_rule_match
Date: Fri, 04 Feb 2022 09:51:29 +0800
Message-ID: <202202040943.IMXWtRrp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5656741164198485124==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220202235323.23929-7-casey@schaufler-ca.com>
References: <20220202235323.23929-7-casey@schaufler-ca.com>
TO: Casey Schaufler <casey@schaufler-ca.com>

Hi Casey,

I love your patch! Perhaps something to improve:

[auto build test WARNING on pcmoore-audit/next]
[also build test WARNING on nf-next/master nf/master linus/master v5.17-rc2=
 next-20220203]
[cannot apply to jmorris-security/next-testing]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Casey-Schaufler/integrity-=
disassociate-ima_filter_rule-from-security_audit_rule/20220203-085302
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git n=
ext
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: i386-randconfig-m021-20220131 (https://download.01.org/0day-ci/arch=
ive/20220204/202202040943.IMXWtRrp-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
include/linux/security.h:168 lsmblob_init() warn: we never enter this loop
include/linux/security.h:168 lsmblob_init() warn: we never enter this loop

vim +168 include/linux/security.h

bf89f6ca211a1d Casey Schaufler 2022-02-02  156  =

bf89f6ca211a1d Casey Schaufler 2022-02-02  157  /**
bf89f6ca211a1d Casey Schaufler 2022-02-02  158   * lsmblob_init - initializ=
e an lsmblob structure
bf89f6ca211a1d Casey Schaufler 2022-02-02  159   * @blob: Pointer to the da=
ta to initialize
bf89f6ca211a1d Casey Schaufler 2022-02-02  160   * @secid: The initial seci=
d value
bf89f6ca211a1d Casey Schaufler 2022-02-02  161   *
bf89f6ca211a1d Casey Schaufler 2022-02-02  162   * Set all secid for all mo=
dules to the specified value.
bf89f6ca211a1d Casey Schaufler 2022-02-02  163   */
bf89f6ca211a1d Casey Schaufler 2022-02-02  164  static inline void lsmblob_=
init(struct lsmblob *blob, u32 secid)
bf89f6ca211a1d Casey Schaufler 2022-02-02  165  {
bf89f6ca211a1d Casey Schaufler 2022-02-02  166  	int i;
bf89f6ca211a1d Casey Schaufler 2022-02-02  167  =

bf89f6ca211a1d Casey Schaufler 2022-02-02 @168  	for (i =3D 0; i < LSMBLOB_=
ENTRIES; i++)
bf89f6ca211a1d Casey Schaufler 2022-02-02  169  		blob->secid[i] =3D secid;
bf89f6ca211a1d Casey Schaufler 2022-02-02  170  }
bf89f6ca211a1d Casey Schaufler 2022-02-02  171  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5656741164198485124==--

