Content-Type: multipart/mixed; boundary="===============2352187095037286691=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4526/13542] security/integrity/evm/evm_main.c:460:17: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Thu, 28 Jul 2022 23:24:32 +0800
Message-ID: <202207282331.hPZiHPEC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2352187095037286691==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "commit no functional change"
:::::: Manual check reason: "low confidence static check warning: security/=
integrity/evm/evm_main.c:460:17: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Christian Brauner <brauner@kernel.org>
CC: Seth Forshee <sforshee@digitalocean.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   7c5e07b73ff3011c9b82d4a3286a3362b951ad2b
commit: 35faf3109a78516f60ca13f957083d5e5535fde0 [4526/13542] fs: port to i=
attr ownership update helpers
:::::: branch date: 4 hours ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-c002-20220727 (https://download.01.org/0day-ci/archi=
ve/20220728/202207282331.hPZiHPEC-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D35faf3109a78516f60ca13f957083d5e5535fde0
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 35faf3109a78516f60ca13f957083d5e5535fde0
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   security/integrity/evm/evm_main.c: In function 'evm_xattr_acl_change':
>> security/integrity/evm/evm_main.c:460:17: warning: use of uninitialized =
value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     460 |         umode_t mode;
         |                 ^~~~
     'evm_xattr_change': events 1-4
       |
       |  504 | static int evm_xattr_change(struct user_namespace *mnt_user=
ns,
       |      |            ^~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'evm_xattr_change'
       |......
       |  511 |         if (posix_xattr_acl(xattr_name))
       |      |            ~
       |      |            |
       |      |            (2) following 'true' branch...
       |  512 |                 return evm_xattr_acl_change(mnt_userns, den=
try, xattr_name,
       |      |                 ~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
       |      |                 |      |
       |      |                 |      (4) calling 'evm_xattr_acl_change' f=
rom 'evm_xattr_change'
       |      |                 (3) ...to here
       |  513 |                                             xattr_value, xa=
ttr_value_len);
       |      |                                             ~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
       |
       +--> 'evm_xattr_acl_change': events 5-6
              |
              |  455 | static int evm_xattr_acl_change(struct user_namespac=
e *mnt_userns,
              |      |            ^~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (5) entry to 'evm_xattr_acl_change'
              |......
              |  460 |         umode_t mode;
              |      |                 ~~~~
              |      |                 |
              |      |                 (6) use of uninitialized value '<unk=
nown>' here
              |
   security/integrity/evm/evm_main.c:461:40: warning: use of uninitialized =
value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     461 |         struct posix_acl *acl =3D NULL, *acl_res;
         |                                        ^~~~~~~
     'evm_xattr_change': events 1-4
       |
       |  504 | static int evm_xattr_change(struct user_namespace *mnt_user=
ns,
       |      |            ^~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'evm_xattr_change'
       |......
       |  511 |         if (posix_xattr_acl(xattr_name))
       |      |            ~
       |      |            |
       |      |            (2) following 'true' branch...
       |  512 |                 return evm_xattr_acl_change(mnt_userns, den=
try, xattr_name,
       |      |                 ~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
       |      |                 |      |
       |      |                 |      (4) calling 'evm_xattr_acl_change' f=
rom 'evm_xattr_change'
       |      |                 (3) ...to here
       |  513 |                                             xattr_value, xa=
ttr_value_len);
       |      |                                             ~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
       |
       +--> 'evm_xattr_acl_change': events 5-6
              |
              |  455 | static int evm_xattr_acl_change(struct user_namespac=
e *mnt_userns,
              |      |            ^~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (5) entry to 'evm_xattr_acl_change'
              |......
              |  461 |         struct posix_acl *acl =3D NULL, *acl_res;
              |      |                                        ~~~~~~~
              |      |                                        |
              |      |                                        (6) use of un=
initialized value '<unknown>' here
              |

vim +460 security/integrity/evm/evm_main.c

7102ebcd65c1cdb Mimi Zohar    2011-05-12  442  =

1886ab01a3fb98e Roberto Sassu 2021-05-14  443  /*
1886ab01a3fb98e Roberto Sassu 2021-05-14  444   * evm_xattr_acl_change - ch=
eck if passed ACL changes the inode mode
1886ab01a3fb98e Roberto Sassu 2021-05-14  445   * @mnt_userns: user namespa=
ce of the idmapped mount
1886ab01a3fb98e Roberto Sassu 2021-05-14  446   * @dentry: pointer to the a=
ffected dentry
1886ab01a3fb98e Roberto Sassu 2021-05-14  447   * @xattr_name: requested xa=
ttr
1886ab01a3fb98e Roberto Sassu 2021-05-14  448   * @xattr_value: requested x=
attr value
1886ab01a3fb98e Roberto Sassu 2021-05-14  449   * @xattr_value_len: request=
ed xattr value length
1886ab01a3fb98e Roberto Sassu 2021-05-14  450   *
1886ab01a3fb98e Roberto Sassu 2021-05-14  451   * Check if passed ACL chang=
es the inode mode, which is protected by EVM.
1886ab01a3fb98e Roberto Sassu 2021-05-14  452   *
1886ab01a3fb98e Roberto Sassu 2021-05-14  453   * Returns 1 if passed ACL c=
auses inode mode change, 0 otherwise.
1886ab01a3fb98e Roberto Sassu 2021-05-14  454   */
1886ab01a3fb98e Roberto Sassu 2021-05-14  455  static int evm_xattr_acl_cha=
nge(struct user_namespace *mnt_userns,
1886ab01a3fb98e Roberto Sassu 2021-05-14  456  				struct dentry *dentry, c=
onst char *xattr_name,
1886ab01a3fb98e Roberto Sassu 2021-05-14  457  				const void *xattr_value,=
 size_t xattr_value_len)
1886ab01a3fb98e Roberto Sassu 2021-05-14  458  {
1886ab01a3fb98e Roberto Sassu 2021-05-14  459  #ifdef CONFIG_FS_POSIX_ACL
1886ab01a3fb98e Roberto Sassu 2021-05-14 @460  	umode_t mode;
1886ab01a3fb98e Roberto Sassu 2021-05-14  461  	struct posix_acl *acl =3D N=
ULL, *acl_res;
1886ab01a3fb98e Roberto Sassu 2021-05-14  462  	struct inode *inode =3D d_b=
acking_inode(dentry);
1886ab01a3fb98e Roberto Sassu 2021-05-14  463  	int rc;
1886ab01a3fb98e Roberto Sassu 2021-05-14  464  =

1886ab01a3fb98e Roberto Sassu 2021-05-14  465  	/*
1886ab01a3fb98e Roberto Sassu 2021-05-14  466  	 * user_ns is not relevant =
here, ACL_USER/ACL_GROUP don't have impact
1886ab01a3fb98e Roberto Sassu 2021-05-14  467  	 * on the inode mode (see p=
osix_acl_equiv_mode()).
1886ab01a3fb98e Roberto Sassu 2021-05-14  468  	 */
1886ab01a3fb98e Roberto Sassu 2021-05-14  469  	acl =3D posix_acl_from_xatt=
r(&init_user_ns, xattr_value, xattr_value_len);
1886ab01a3fb98e Roberto Sassu 2021-05-14  470  	if (IS_ERR_OR_NULL(acl))
1886ab01a3fb98e Roberto Sassu 2021-05-14  471  		return 1;
1886ab01a3fb98e Roberto Sassu 2021-05-14  472  =

1886ab01a3fb98e Roberto Sassu 2021-05-14  473  	acl_res =3D acl;
1886ab01a3fb98e Roberto Sassu 2021-05-14  474  	/*
1886ab01a3fb98e Roberto Sassu 2021-05-14  475  	 * Passing mnt_userns is ne=
cessary to correctly determine the GID in
1886ab01a3fb98e Roberto Sassu 2021-05-14  476  	 * an idmapped mount, as th=
e GID is used to clear the setgid bit in
1886ab01a3fb98e Roberto Sassu 2021-05-14  477  	 * the inode mode.
1886ab01a3fb98e Roberto Sassu 2021-05-14  478  	 */
1886ab01a3fb98e Roberto Sassu 2021-05-14  479  	rc =3D posix_acl_update_mod=
e(mnt_userns, inode, &mode, &acl_res);
1886ab01a3fb98e Roberto Sassu 2021-05-14  480  =

1886ab01a3fb98e Roberto Sassu 2021-05-14  481  	posix_acl_release(acl);
1886ab01a3fb98e Roberto Sassu 2021-05-14  482  =

1886ab01a3fb98e Roberto Sassu 2021-05-14  483  	if (rc)
1886ab01a3fb98e Roberto Sassu 2021-05-14  484  		return 1;
1886ab01a3fb98e Roberto Sassu 2021-05-14  485  =

1886ab01a3fb98e Roberto Sassu 2021-05-14  486  	if (inode->i_mode !=3D mode)
1886ab01a3fb98e Roberto Sassu 2021-05-14  487  		return 1;
1886ab01a3fb98e Roberto Sassu 2021-05-14  488  #endif
1886ab01a3fb98e Roberto Sassu 2021-05-14  489  	return 0;
1886ab01a3fb98e Roberto Sassu 2021-05-14  490  }
1886ab01a3fb98e Roberto Sassu 2021-05-14  491  =


:::::: The code at line 460 was first introduced by commit
:::::: 1886ab01a3fb98ee7f7739ae50eb9492f5df3641 evm: Allow setxattr() and s=
etattr() for unmodified metadata

:::::: TO: Roberto Sassu <roberto.sassu@huawei.com>
:::::: CC: Mimi Zohar <zohar@linux.ibm.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2352187095037286691==--

