Content-Type: multipart/mixed; boundary="===============1293111830643299979=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v33 07/29] LSM: Use lsmblob in security_kernel_act_as
Date: Sat, 12 Mar 2022 07:05:13 +0800
Message-ID: <202203120725.qzDgIYI3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1293111830643299979==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220310234632.16194-8-casey@schaufler-ca.com>
References: <20220310234632.16194-8-casey@schaufler-ca.com>
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
[also build test WARNING on linus/master v5.17-rc7]
[cannot apply to pcmoore-selinux/next jmorris-security/next-testing next-20=
220310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Casey-Schaufler/integrity-=
disassociate-ima_filter_rule-from-security_audit_rule/20220311-084644
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git n=
ext
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20312/202203120725.qzDgIYI3-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
include/linux/security.h:168 lsmblob_init() warn: we never enter this loop

vim +168 include/linux/security.h

9fb0768247631e3 Casey Schaufler 2022-03-10  156  =

9fb0768247631e3 Casey Schaufler 2022-03-10  157  /**
9fb0768247631e3 Casey Schaufler 2022-03-10  158   * lsmblob_init - initiali=
ze a lsmblob structure
9fb0768247631e3 Casey Schaufler 2022-03-10  159   * @blob: Pointer to the d=
ata to initialize
9fb0768247631e3 Casey Schaufler 2022-03-10  160   * @secid: The initial sec=
id value
9fb0768247631e3 Casey Schaufler 2022-03-10  161   *
9fb0768247631e3 Casey Schaufler 2022-03-10  162   * Set all secid for all m=
odules to the specified value.
9fb0768247631e3 Casey Schaufler 2022-03-10  163   */
9fb0768247631e3 Casey Schaufler 2022-03-10  164  static inline void lsmblob=
_init(struct lsmblob *blob, u32 secid)
9fb0768247631e3 Casey Schaufler 2022-03-10  165  {
9fb0768247631e3 Casey Schaufler 2022-03-10  166  	int i;
9fb0768247631e3 Casey Schaufler 2022-03-10  167  =

9fb0768247631e3 Casey Schaufler 2022-03-10 @168  	for (i =3D 0; i < LSMBLOB=
_ENTRIES; i++)
9fb0768247631e3 Casey Schaufler 2022-03-10  169  		blob->secid[i] =3D secid;
9fb0768247631e3 Casey Schaufler 2022-03-10  170  }
9fb0768247631e3 Casey Schaufler 2022-03-10  171  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1293111830643299979==--

