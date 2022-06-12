Content-Type: multipart/mixed; boundary="===============4959941202790826635=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v36 07/33] LSM: Use lsmblob in security_kernel_act_as
Date: Sun, 12 Jun 2022 22:41:20 +0800
Message-ID: <202206122240.t0crUB1l-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4959941202790826635==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220609230146.319210-8-casey@schaufler-ca.com>
References: <20220609230146.319210-8-casey@schaufler-ca.com>
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
[also build test WARNING on pcmoore-selinux/next linus/master v5.19-rc1 nex=
t-20220610]
[cannot apply to jmorris-security/next-testing]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Casey-Schaufler/inte=
grity-disassociate-ima_filter_rule-from-security_audit_rule/20220610-080129
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git n=
ext
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
612/202206122240.t0crUB1l-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
include/linux/security.h:170 lsmblob_init() warn: we never enter this loop

vim +170 include/linux/security.h

03e5d0189b60bc Casey Schaufler 2022-06-09  158  =

03e5d0189b60bc Casey Schaufler 2022-06-09  159  /**
03e5d0189b60bc Casey Schaufler 2022-06-09  160   * lsmblob_init - initializ=
e a lsmblob structure
03e5d0189b60bc Casey Schaufler 2022-06-09  161   * @blob: Pointer to the da=
ta to initialize
03e5d0189b60bc Casey Schaufler 2022-06-09  162   * @secid: The initial seci=
d value
03e5d0189b60bc Casey Schaufler 2022-06-09  163   *
03e5d0189b60bc Casey Schaufler 2022-06-09  164   * Set all secid for all mo=
dules to the specified value.
03e5d0189b60bc Casey Schaufler 2022-06-09  165   */
03e5d0189b60bc Casey Schaufler 2022-06-09  166  static inline void lsmblob_=
init(struct lsmblob *blob, u32 secid)
03e5d0189b60bc Casey Schaufler 2022-06-09  167  {
03e5d0189b60bc Casey Schaufler 2022-06-09  168  	int i;
03e5d0189b60bc Casey Schaufler 2022-06-09  169  =

03e5d0189b60bc Casey Schaufler 2022-06-09 @170  	for (i =3D 0; i < LSMBLOB_=
ENTRIES; i++)
03e5d0189b60bc Casey Schaufler 2022-06-09  171  		blob->secid[i] =3D secid;
03e5d0189b60bc Casey Schaufler 2022-06-09  172  }
03e5d0189b60bc Casey Schaufler 2022-06-09  173  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4959941202790826635==--

