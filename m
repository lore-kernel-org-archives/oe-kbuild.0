Content-Type: multipart/mixed; boundary="===============4158939320289384796=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v36 10/33] LSM: Use lsmblob in security_ipc_getsecid
Date: Fri, 17 Jun 2022 07:28:38 +0800
Message-ID: <202206170730.cJyrAncf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4158939320289384796==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220609230146.319210-11-casey@schaufler-ca.com>
References: <20220609230146.319210-11-casey@schaufler-ca.com>
TO: Casey Schaufler <casey@schaufler-ca.com>
TO: casey.schaufler(a)intel.com
TO: jmorris(a)namei.org
TO: linux-security-module(a)vger.kernel.org
TO: selinux(a)vger.kernel.org
CC: casey(a)schaufler-ca.com
CC: linux-audit(a)redhat.com
CC: keescook(a)chromium.org
CC: john.johansen(a)canonical.com
CC: penguin-kernel(a)i-love.sakura.ne.jp
CC: paul(a)paul-moore.com
CC: stephen.smalley.work(a)gmail.com
CC: linux-kernel(a)vger.kernel.org

Hi Casey,

I love your patch! Perhaps something to improve:

[auto build test WARNING on pcmoore-audit/next]
[also build test WARNING on pcmoore-selinux/next linus/master v5.19-rc2 nex=
t-20220616]
[cannot apply to jmorris-security/next-testing]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Casey-Schaufler/inte=
grity-disassociate-ima_filter_rule-from-security_audit_rule/20220610-080129
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git n=
ext
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-m001-20220613 (https://download.01.org/0day-ci/ar=
chive/20220617/202206170730.cJyrAncf-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
include/linux/security.h:218 lsmblob_value() warn: we never enter this loop

Old smatch warnings:
include/linux/security.h:170 lsmblob_init() warn: we never enter this loop

vim +218 include/linux/security.h

767517968014af Casey Schaufler 2022-06-09  203  =

86979553fd37a9 Casey Schaufler 2022-06-09  204  /**
86979553fd37a9 Casey Schaufler 2022-06-09  205   * lsmblob_value - find the=
 first non-zero value in an lsmblob structure.
86979553fd37a9 Casey Schaufler 2022-06-09  206   * @blob: Pointer to the da=
ta
86979553fd37a9 Casey Schaufler 2022-06-09  207   *
86979553fd37a9 Casey Schaufler 2022-06-09  208   * This needs to be used wi=
th extreme caution, as the cases where
86979553fd37a9 Casey Schaufler 2022-06-09  209   * it is appropriate are ra=
re.
86979553fd37a9 Casey Schaufler 2022-06-09  210   *
86979553fd37a9 Casey Schaufler 2022-06-09  211   * Return the first secid v=
alue set in the lsmblob.
86979553fd37a9 Casey Schaufler 2022-06-09  212   * There should only be one.
86979553fd37a9 Casey Schaufler 2022-06-09  213   */
86979553fd37a9 Casey Schaufler 2022-06-09  214  static inline u32 lsmblob_v=
alue(const struct lsmblob *blob)
86979553fd37a9 Casey Schaufler 2022-06-09  215  {
86979553fd37a9 Casey Schaufler 2022-06-09  216  	int i;
86979553fd37a9 Casey Schaufler 2022-06-09  217  =

86979553fd37a9 Casey Schaufler 2022-06-09 @218  	for (i =3D 0; i < LSMBLOB_=
ENTRIES; i++)
86979553fd37a9 Casey Schaufler 2022-06-09  219  		if (blob->secid[i])
86979553fd37a9 Casey Schaufler 2022-06-09  220  			return blob->secid[i];
86979553fd37a9 Casey Schaufler 2022-06-09  221  =

86979553fd37a9 Casey Schaufler 2022-06-09  222  	return 0;
86979553fd37a9 Casey Schaufler 2022-06-09  223  }
86979553fd37a9 Casey Schaufler 2022-06-09  224  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4158939320289384796==--

