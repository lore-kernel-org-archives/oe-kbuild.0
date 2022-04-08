Content-Type: multipart/mixed; boundary="===============8169731448653022061=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v34 07/29] LSM: Use lsmblob in security_kernel_act_as
Date: Fri, 08 Apr 2022 20:05:26 +0800
Message-ID: <202204081946.EBDOZXmQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8169731448653022061==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220407212230.12893-8-casey@schaufler-ca.com>
References: <20220407212230.12893-8-casey@schaufler-ca.com>
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

[auto build test WARNING on pcmoore-selinux/next]
[also build test WARNING on linus/master v5.18-rc1 next-20220408]
[cannot apply to pcmoore-audit/next jmorris-security/next-testing]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Casey-Schaufler/inte=
grity-disassociate-ima_filter_rule-from-security_audit_rule/20220408-062243
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git=
 next
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20408/202204081946.EBDOZXmQ-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
include/linux/security.h:168 lsmblob_init() warn: we never enter this loop

vim +168 include/linux/security.h

306a568d88f9e88 Casey Schaufler 2022-04-07  156  =

306a568d88f9e88 Casey Schaufler 2022-04-07  157  /**
306a568d88f9e88 Casey Schaufler 2022-04-07  158   * lsmblob_init - initiali=
ze a lsmblob structure
306a568d88f9e88 Casey Schaufler 2022-04-07  159   * @blob: Pointer to the d=
ata to initialize
306a568d88f9e88 Casey Schaufler 2022-04-07  160   * @secid: The initial sec=
id value
306a568d88f9e88 Casey Schaufler 2022-04-07  161   *
306a568d88f9e88 Casey Schaufler 2022-04-07  162   * Set all secid for all m=
odules to the specified value.
306a568d88f9e88 Casey Schaufler 2022-04-07  163   */
306a568d88f9e88 Casey Schaufler 2022-04-07  164  static inline void lsmblob=
_init(struct lsmblob *blob, u32 secid)
306a568d88f9e88 Casey Schaufler 2022-04-07  165  {
306a568d88f9e88 Casey Schaufler 2022-04-07  166  	int i;
306a568d88f9e88 Casey Schaufler 2022-04-07  167  =

306a568d88f9e88 Casey Schaufler 2022-04-07 @168  	for (i =3D 0; i < LSMBLOB=
_ENTRIES; i++)
306a568d88f9e88 Casey Schaufler 2022-04-07  169  		blob->secid[i] =3D secid;
306a568d88f9e88 Casey Schaufler 2022-04-07  170  }
306a568d88f9e88 Casey Schaufler 2022-04-07  171  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8169731448653022061==--

