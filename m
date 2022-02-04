Content-Type: multipart/mixed; boundary="===============7049390316396616179=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v32 08/28] LSM: Use lsmblob in security_secctx_to_secid
Date: Fri, 04 Feb 2022 23:05:50 +0800
Message-ID: <202202042344.tTudBg44-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7049390316396616179==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220202235323.23929-9-casey@schaufler-ca.com>
References: <20220202235323.23929-9-casey@schaufler-ca.com>
TO: Casey Schaufler <casey@schaufler-ca.com>

Hi Casey,

I love your patch! Perhaps something to improve:

[auto build test WARNING on pcmoore-audit/next]
[also build test WARNING on nf-next/master nf/master linus/master v5.17-rc2=
 next-20220204]
[cannot apply to jmorris-security/next-testing]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Casey-Schaufler/integrity-=
disassociate-ima_filter_rule-from-security_audit_rule/20220203-085302
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git n=
ext
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-m021-20220131 (https://download.01.org/0day-ci/arch=
ive/20220204/202202042344.tTudBg44-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
include/linux/security.h:215 lsmblob_value() warn: we never enter this loop

vim +215 include/linux/security.h

7a3a34d2277c60 Casey Schaufler 2022-02-02  200  =

d7dd3b5434a8d2 Casey Schaufler 2022-02-02  201  /**
d7dd3b5434a8d2 Casey Schaufler 2022-02-02  202   * lsmblob_value - find the=
 first non-zero value in an lsmblob structure.
d7dd3b5434a8d2 Casey Schaufler 2022-02-02  203   * @blob: Pointer to the da=
ta
d7dd3b5434a8d2 Casey Schaufler 2022-02-02  204   *
d7dd3b5434a8d2 Casey Schaufler 2022-02-02  205   * This needs to be used wi=
th extreme caution, as the cases where
d7dd3b5434a8d2 Casey Schaufler 2022-02-02  206   * it is appropriate are ra=
re.
d7dd3b5434a8d2 Casey Schaufler 2022-02-02  207   *
d7dd3b5434a8d2 Casey Schaufler 2022-02-02  208   * Return the first secid v=
alue set in the lsmblob.
d7dd3b5434a8d2 Casey Schaufler 2022-02-02  209   * There should only be one.
d7dd3b5434a8d2 Casey Schaufler 2022-02-02  210   */
d7dd3b5434a8d2 Casey Schaufler 2022-02-02  211  static inline u32 lsmblob_v=
alue(const struct lsmblob *blob)
d7dd3b5434a8d2 Casey Schaufler 2022-02-02  212  {
d7dd3b5434a8d2 Casey Schaufler 2022-02-02  213  	int i;
d7dd3b5434a8d2 Casey Schaufler 2022-02-02  214  =

d7dd3b5434a8d2 Casey Schaufler 2022-02-02 @215  	for (i =3D 0; i < LSMBLOB_=
ENTRIES; i++)
d7dd3b5434a8d2 Casey Schaufler 2022-02-02  216  		if (blob->secid[i])
d7dd3b5434a8d2 Casey Schaufler 2022-02-02  217  			return blob->secid[i];
d7dd3b5434a8d2 Casey Schaufler 2022-02-02  218  =

d7dd3b5434a8d2 Casey Schaufler 2022-02-02  219  	return 0;
d7dd3b5434a8d2 Casey Schaufler 2022-02-02  220  }
d7dd3b5434a8d2 Casey Schaufler 2022-02-02  221  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7049390316396616179==--

