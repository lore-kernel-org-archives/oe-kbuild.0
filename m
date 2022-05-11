Content-Type: multipart/mixed; boundary="===============4557808674434518574=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [allisonhenderson-xfs-work:xfs-5.19-compose_pptrs 25/32] fs/xfs/libxfs/xfs_attr.c:556:21: warning: Value stored to 'dp' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 11 May 2022 09:19:19 +0800
Message-ID: <202205110952.DfPq58IV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4557808674434518574==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Allison Henderson <allison.henderson@oracle.com>
CC: Dave Chinner <dchinner@redhat.com>

tree:   https://github.com/allisonhenderson/xfs_work.git xfs-5.19-compose_p=
ptrs
head:   74ecccf0e89a132c2490f3a63661c535974c6a08
commit: 7a5d447970de2d3b003b9015e2bce3bf0d15e3db [25/32] xfs: parent pointe=
r attribute creation
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20511/202205110952.DfPq58IV-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004f=
b787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/allisonhenderson/xfs_work/commit/7a5d447970de2=
d3b003b9015e2bce3bf0d15e3db
        git remote add allisonhenderson-xfs-work https://github.com/allison=
henderson/xfs_work.git
        git fetch --no-tags allisonhenderson-xfs-work xfs-5.19-compose_pptrs
        git checkout 7a5d447970de2d3b003b9015e2bce3bf0d15e3db
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/xfs/xfs_ioctl.c:1744:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(label, 0, sizeof(label));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/xfs/xfs_ioctl.c:1744:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(label, 0, sizeof(label));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/xfs/xfs_ioctl.c:1746:2: warning: Call to function 'strncpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(label, sbp->sb_fname, XFSLABEL_MAX);
           ^~~~~~~
   fs/xfs/xfs_ioctl.c:1746:2: note: Call to function 'strncpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'strncpy_s' in case of C11
           strncpy(label, sbp->sb_fname, XFSLABEL_MAX);
           ^~~~~~~
   fs/xfs/xfs_ioctl.c:1784:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(sbp->sb_fname, 0, sizeof(sbp->sb_fname));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/xfs/xfs_ioctl.c:1784:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(sbp->sb_fname, 0, sizeof(sbp->sb_fname));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/xfs/xfs_ioctl.c:1785:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(sbp->sb_fname, label, len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/xfs/xfs_ioctl.c:1785:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(sbp->sb_fname, label, len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   fs/xfs/libxfs/xfs_attr.c:495:2: warning: Value stored to 'error' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           error =3D 0;
           ^       ~
   fs/xfs/libxfs/xfs_attr.c:495:2: note: Value stored to 'error' is never r=
ead
           error =3D 0;
           ^       ~
>> fs/xfs/libxfs/xfs_attr.c:556:21: warning: Value stored to 'dp' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct xfs_inode                *dp =3D args->dp;
                                            ^~   ~~~~~~~~
   fs/xfs/libxfs/xfs_attr.c:556:21: note: Value stored to 'dp' during its i=
nitialization is never read
           struct xfs_inode                *dp =3D args->dp;
                                            ^~   ~~~~~~~~
>> fs/xfs/libxfs/xfs_attr.c:559:21: warning: Value stored to 'mp' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct xfs_mount                *mp =3D args->dp->i_mount;
                                            ^~   ~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_attr.c:559:21: note: Value stored to 'mp' during its i=
nitialization is never read
           struct xfs_mount                *mp =3D args->dp->i_mount;
                                            ^~   ~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_attr.c:1402:2: warning: Value stored to 'error' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           error =3D xfs_attr_node_removename(args, state);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_attr.c:1402:2: note: Value stored to 'error' is never =
read
           error =3D xfs_attr_node_removename(args, state);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 53 warnings (47 in non-user code, 6 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   83 warnings generated.
   fs/xfs/libxfs/xfs_attr_leaf.c:523:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(args->value, value, valuelen);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_attr_leaf.c:523:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(args->value, value, valuelen);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_attr_leaf.c:678:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(hdr, 0, sizeof(*hdr));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_attr_leaf.c:678:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(hdr, 0, sizeof(*hdr));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_attr_leaf.c:765:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(sfe->nameval, args->name, args->namelen);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_attr_leaf.c:765:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(sfe->nameval, args->name, args->namelen);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_attr_leaf.c:766:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&sfe->nameval[args->namelen], args->value, args->valuelen=
);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here

vim +/dp +556 fs/xfs/libxfs/xfs_attr.c

b8d9a2124c0193 Dave Chinner      2022-04-14  478  =

b8d9a2124c0193 Dave Chinner      2022-04-14  479  /*
b8d9a2124c0193 Dave Chinner      2022-04-14  480   * Initial setup for xfs_=
attr_node_removename.  Make sure the attr is there and
b8d9a2124c0193 Dave Chinner      2022-04-14  481   * the blocks are valid. =
 Attr keys with remote blocks will be marked
b8d9a2124c0193 Dave Chinner      2022-04-14  482   * incomplete.
b8d9a2124c0193 Dave Chinner      2022-04-14  483   */
b8d9a2124c0193 Dave Chinner      2022-04-14  484  static
b8d9a2124c0193 Dave Chinner      2022-04-14  485  int xfs_attr_node_removen=
ame_setup(
b8d9a2124c0193 Dave Chinner      2022-04-14  486  	struct xfs_attr_item		*a=
ttr)
b8d9a2124c0193 Dave Chinner      2022-04-14  487  {
b8d9a2124c0193 Dave Chinner      2022-04-14  488  	struct xfs_da_args		*arg=
s =3D attr->xattri_da_args;
b8d9a2124c0193 Dave Chinner      2022-04-14  489  	struct xfs_da_state		**s=
tate =3D &attr->xattri_da_state;
b8d9a2124c0193 Dave Chinner      2022-04-14  490  	int				error;
b8d9a2124c0193 Dave Chinner      2022-04-14  491  =

b8d9a2124c0193 Dave Chinner      2022-04-14  492  	error =3D xfs_attr_node_=
hasname(args, state);
b8d9a2124c0193 Dave Chinner      2022-04-14  493  	if (error !=3D -EEXIST)
b8d9a2124c0193 Dave Chinner      2022-04-14  494  		goto out;
b8d9a2124c0193 Dave Chinner      2022-04-14 @495  	error =3D 0;
b8d9a2124c0193 Dave Chinner      2022-04-14  496  =

b8d9a2124c0193 Dave Chinner      2022-04-14  497  	ASSERT((*state)->path.bl=
k[(*state)->path.active - 1].bp !=3D NULL);
b8d9a2124c0193 Dave Chinner      2022-04-14  498  	ASSERT((*state)->path.bl=
k[(*state)->path.active - 1].magic =3D=3D
b8d9a2124c0193 Dave Chinner      2022-04-14  499  		XFS_ATTR_LEAF_MAGIC);
b8d9a2124c0193 Dave Chinner      2022-04-14  500  =

b8d9a2124c0193 Dave Chinner      2022-04-14  501  	error =3D xfs_attr_leaf_=
mark_incomplete(args, *state);
b8d9a2124c0193 Dave Chinner      2022-04-14  502  	if (error)
b8d9a2124c0193 Dave Chinner      2022-04-14  503  		goto out;
26b33e76e2c392 Dave Chinner      2022-04-14  504  	if (args->rmtblkno > 0)
b8d9a2124c0193 Dave Chinner      2022-04-14  505  		error =3D xfs_attr_rmtv=
al_invalidate(args);
b8d9a2124c0193 Dave Chinner      2022-04-14  506  out:
b8d9a2124c0193 Dave Chinner      2022-04-14  507  	if (error)
b8d9a2124c0193 Dave Chinner      2022-04-14  508  		xfs_da_state_free(*stat=
e);
b8d9a2124c0193 Dave Chinner      2022-04-14  509  =

b8d9a2124c0193 Dave Chinner      2022-04-14  510  	return error;
b8d9a2124c0193 Dave Chinner      2022-04-14  511  }
b8d9a2124c0193 Dave Chinner      2022-04-14  512  =

e683cdbb8baf82 Dave Chinner      2022-04-14  513  /*
e683cdbb8baf82 Dave Chinner      2022-04-14  514   * Remove the original at=
tr we have just replaced. This is dependent on the
e683cdbb8baf82 Dave Chinner      2022-04-14  515   * original lookup and in=
sert placing the old attr in args->blkno/args->index
e683cdbb8baf82 Dave Chinner      2022-04-14  516   * and the new attr in ar=
gs->blkno2/args->index2.
e683cdbb8baf82 Dave Chinner      2022-04-14  517   */
e683cdbb8baf82 Dave Chinner      2022-04-14  518  static int
e683cdbb8baf82 Dave Chinner      2022-04-14  519  xfs_attr_leaf_remove_attr(
e683cdbb8baf82 Dave Chinner      2022-04-14  520  	struct xfs_attr_item		*a=
ttr)
e683cdbb8baf82 Dave Chinner      2022-04-14  521  {
e683cdbb8baf82 Dave Chinner      2022-04-14  522  	struct xfs_da_args      =
        *args =3D attr->xattri_da_args;
e683cdbb8baf82 Dave Chinner      2022-04-14  523  	struct xfs_inode		*dp =
=3D args->dp;
e683cdbb8baf82 Dave Chinner      2022-04-14  524  	struct xfs_buf			*bp =3D=
 NULL;
e683cdbb8baf82 Dave Chinner      2022-04-14  525  	int				forkoff;
e683cdbb8baf82 Dave Chinner      2022-04-14  526  	int				error;
e683cdbb8baf82 Dave Chinner      2022-04-14  527  =

e683cdbb8baf82 Dave Chinner      2022-04-14  528  	error =3D xfs_attr3_leaf=
_read(args->trans, args->dp, args->blkno,
e683cdbb8baf82 Dave Chinner      2022-04-14  529  				   &bp);
e683cdbb8baf82 Dave Chinner      2022-04-14  530  	if (error)
e683cdbb8baf82 Dave Chinner      2022-04-14  531  		return error;
e683cdbb8baf82 Dave Chinner      2022-04-14  532  =

e683cdbb8baf82 Dave Chinner      2022-04-14  533  	xfs_attr3_leaf_remove(bp=
, args);
e683cdbb8baf82 Dave Chinner      2022-04-14  534  =

e683cdbb8baf82 Dave Chinner      2022-04-14  535  	forkoff =3D xfs_attr_sho=
rtform_allfit(bp, dp);
e683cdbb8baf82 Dave Chinner      2022-04-14  536  	if (forkoff)
e683cdbb8baf82 Dave Chinner      2022-04-14  537  		error =3D xfs_attr3_lea=
f_to_shortform(bp, args, forkoff);
e683cdbb8baf82 Dave Chinner      2022-04-14  538  		/* bp is gone due to xf=
s_da_shrink_inode */
e683cdbb8baf82 Dave Chinner      2022-04-14  539  =

e683cdbb8baf82 Dave Chinner      2022-04-14  540  	return error;
e683cdbb8baf82 Dave Chinner      2022-04-14  541  }
e683cdbb8baf82 Dave Chinner      2022-04-14  542  =

db1a28cc591c1a Allison Collins   2020-07-20  543  /*
d56c93997e96ed Dave Chinner      2022-04-14  544   * Run the attribute oper=
ation specified in @attr.
d56c93997e96ed Dave Chinner      2022-04-14  545   *
d56c93997e96ed Dave Chinner      2022-04-14  546   * This routine is meant =
to function as a delayed operation and will set the
d56c93997e96ed Dave Chinner      2022-04-14  547   * state to XFS_DAS_DONE =
when the operation is complete.  Calling functions will
d56c93997e96ed Dave Chinner      2022-04-14  548   * need to handle this, a=
nd recall the function until either an error or
d56c93997e96ed Dave Chinner      2022-04-14  549   * XFS_DAS_DONE is detect=
ed.
db1a28cc591c1a Allison Collins   2020-07-20  550   */
db1a28cc591c1a Allison Collins   2020-07-20  551  int
8f502a4009822a Allison Henderson 2021-05-21  552  xfs_attr_set_iter(
133b4f4350cc51 Allison Henderson 2022-04-11  553  	struct xfs_attr_item		*a=
ttr)
db1a28cc591c1a Allison Collins   2020-07-20  554  {
133b4f4350cc51 Allison Henderson 2022-04-11  555  	struct xfs_da_args      =
        *args =3D attr->xattri_da_args;
7a5d447970de2d Allison Henderson 2022-03-22 @556  	struct xfs_inode		*dp =
=3D args->dp;
7a5d447970de2d Allison Henderson 2022-03-22  557  	struct xfs_buf			*bp =3D=
 NULL;
7a5d447970de2d Allison Henderson 2022-03-22  558  	int				sf_size, forkoff,=
 error =3D 0;
7a5d447970de2d Allison Henderson 2022-03-22 @559  	struct xfs_mount		*mp =
=3D args->dp->i_mount;
7a5d447970de2d Allison Henderson 2022-03-22  560  =

db1a28cc591c1a Allison Collins   2020-07-20  561  =

8f502a4009822a Allison Henderson 2021-05-21  562  	/* State machine switch =
*/
100ba63970eed9 Dave Chinner      2022-04-14  563  next_state:
133b4f4350cc51 Allison Henderson 2022-04-11  564  	switch (attr->xattri_del=
a_state) {
8f502a4009822a Allison Henderson 2021-05-21  565  	case XFS_DAS_UNINIT:
7a5d447970de2d Allison Henderson 2022-03-22  566  		sf_size =3D sizeof(stru=
ct xfs_attr_sf_hdr) +
7a5d447970de2d Allison Henderson 2022-03-22  567  			  xfs_attr_sf_entsize_=
byname(args->namelen,
7a5d447970de2d Allison Henderson 2022-03-22  568  							     args->valuele=
n);
7a5d447970de2d Allison Henderson 2022-03-22  569  		xfs_bmap_set_attrforkof=
f(args->dp, sf_size, NULL);
7a5d447970de2d Allison Henderson 2022-03-22  570  		args->dp->i_afp =3D kme=
m_cache_zalloc(xfs_ifork_cache, 0);
7a5d447970de2d Allison Henderson 2022-03-22  571  		args->dp->i_afp->if_for=
mat =3D XFS_DINODE_FMT_EXTENTS;
5a7bf541843b13 Dave Chinner      2022-04-14  572  	case XFS_DAS_SF_ADD:
133b4f4350cc51 Allison Henderson 2022-04-11  573  		return xfs_attr_sf_addn=
ame(attr);
5a7bf541843b13 Dave Chinner      2022-04-14  574  	case XFS_DAS_LEAF_ADD:
133b4f4350cc51 Allison Henderson 2022-04-11  575  		return xfs_attr_leaf_ad=
dname(attr);
5a7bf541843b13 Dave Chinner      2022-04-14  576  	case XFS_DAS_NODE_ADD:
5a7bf541843b13 Dave Chinner      2022-04-14  577  		return xfs_attr_node_ad=
dname(attr);
3f562d092bb1ed Allison Henderson 2021-02-12  578  =

b8d9a2124c0193 Dave Chinner      2022-04-14  579  	case XFS_DAS_SF_REMOVE:
f589c4f3a7a7d6 Dave Chinner      2022-04-14  580  		error =3D xfs_attr_sf_r=
emovename(args);
f589c4f3a7a7d6 Dave Chinner      2022-04-14  581  		attr->xattri_dela_state=
 =3D xfs_attr_complete_op(attr,
f589c4f3a7a7d6 Dave Chinner      2022-04-14  582  						xfs_attr_init_add_s=
tate(args));
f589c4f3a7a7d6 Dave Chinner      2022-04-14  583  		break;
b8d9a2124c0193 Dave Chinner      2022-04-14  584  	case XFS_DAS_LEAF_REMOVE:
f589c4f3a7a7d6 Dave Chinner      2022-04-14  585  		error =3D xfs_attr_leaf=
_removename(args);
f589c4f3a7a7d6 Dave Chinner      2022-04-14  586  		attr->xattri_dela_state=
 =3D xfs_attr_complete_op(attr,
f589c4f3a7a7d6 Dave Chinner      2022-04-14  587  						xfs_attr_init_add_s=
tate(args));
f589c4f3a7a7d6 Dave Chinner      2022-04-14  588  		break;
b8d9a2124c0193 Dave Chinner      2022-04-14  589  	case XFS_DAS_NODE_REMOVE:
b8d9a2124c0193 Dave Chinner      2022-04-14  590  		error =3D xfs_attr_node=
_removename_setup(attr);
b8d9a2124c0193 Dave Chinner      2022-04-14  591  		if (error)
b8d9a2124c0193 Dave Chinner      2022-04-14  592  			return error;
b8d9a2124c0193 Dave Chinner      2022-04-14  593  		attr->xattri_dela_state=
 =3D XFS_DAS_NODE_REMOVE_RMT;
b8d9a2124c0193 Dave Chinner      2022-04-14  594  		if (args->rmtblkno =3D=
=3D 0)
b8d9a2124c0193 Dave Chinner      2022-04-14  595  			attr->xattri_dela_stat=
e++;
b8d9a2124c0193 Dave Chinner      2022-04-14  596  		break;
b8d9a2124c0193 Dave Chinner      2022-04-14  597  =

020dee1bf99e76 Dave Chinner      2022-04-14  598  	case XFS_DAS_LEAF_SET_RM=
T:
020dee1bf99e76 Dave Chinner      2022-04-14  599  	case XFS_DAS_NODE_SET_RM=
T:
37e7bb8434f8b2 Allison Henderson 2022-04-11  600  		error =3D xfs_attr_rmtv=
al_find_space(attr);
83c6e70789ff37 Allison Henderson 2021-04-19  601  		if (error)
83c6e70789ff37 Allison Henderson 2021-04-19  602  			return error;
100ba63970eed9 Dave Chinner      2022-04-14  603  		attr->xattri_dela_state=
++;
f1fdd499537724 Dave Chinner      2022-04-14  604  		fallthrough;
020dee1bf99e76 Dave Chinner      2022-04-14  605  =

f1fdd499537724 Dave Chinner      2022-04-14  606  	case XFS_DAS_LEAF_ALLOC_=
RMT:
100ba63970eed9 Dave Chinner      2022-04-14  607  	case XFS_DAS_NODE_ALLOC_=
RMT:
020dee1bf99e76 Dave Chinner      2022-04-14  608  		error =3D xfs_attr_rmtv=
al_alloc(attr);
8f502a4009822a Allison Henderson 2021-05-21  609  		if (error)
8f502a4009822a Allison Henderson 2021-05-21  610  			return error;
f027184d93cf76 Dave Chinner      2022-04-14  611  		/*
f027184d93cf76 Dave Chinner      2022-04-14  612  		 * If there is still mo=
re to allocate we need to roll the
f027184d93cf76 Dave Chinner      2022-04-14  613  		 * transaction so we ha=
ve a full transaction reservation for
f027184d93cf76 Dave Chinner      2022-04-14  614  		 * the next allocation.
f027184d93cf76 Dave Chinner      2022-04-14  615  		 */
f027184d93cf76 Dave Chinner      2022-04-14  616  		if (attr->xattri_blkcnt=
 > 0)
f027184d93cf76 Dave Chinner      2022-04-14  617  			break;
020dee1bf99e76 Dave Chinner      2022-04-14  618  		if (attr->xattri_dela_s=
tate =3D=3D XFS_DAS_DONE)
020dee1bf99e76 Dave Chinner      2022-04-14  619  			break;
f027184d93cf76 Dave Chinner      2022-04-14  620  =

f027184d93cf76 Dave Chinner      2022-04-14  621  		goto next_state;
83c6e70789ff37 Allison Henderson 2021-04-19  622  =

020dee1bf99e76 Dave Chinner      2022-04-14  623  	case XFS_DAS_LEAF_REPLAC=
E:
020dee1bf99e76 Dave Chinner      2022-04-14  624  	case XFS_DAS_NODE_REPLAC=
E:
83c6e70789ff37 Allison Henderson 2021-04-19  625  		/*
f027184d93cf76 Dave Chinner      2022-04-14  626  		 * We must "flip" the i=
ncomplete flags on the "new" and "old"
f027184d93cf76 Dave Chinner      2022-04-14  627  		 * attribute/value pair=
s so that one disappears and one appears
6e971e92677394 Dave Chinner      2022-04-14  628  		 * atomically.
83c6e70789ff37 Allison Henderson 2021-04-19  629  		 */
83c6e70789ff37 Allison Henderson 2021-04-19  630  		error =3D xfs_attr3_lea=
f_flipflags(args);
83c6e70789ff37 Allison Henderson 2021-04-19  631  		if (error)
83c6e70789ff37 Allison Henderson 2021-04-19  632  			return error;
83c6e70789ff37 Allison Henderson 2021-04-19  633  		/*
6e971e92677394 Dave Chinner      2022-04-14  634  		 * We must commit the f=
lag value change now to make it atomic
6e971e92677394 Dave Chinner      2022-04-14  635  		 * and then we can star=
t the next trans in series at REMOVE_OLD.
83c6e70789ff37 Allison Henderson 2021-04-19  636  		 */
100ba63970eed9 Dave Chinner      2022-04-14  637  		attr->xattri_dela_state=
++;
020dee1bf99e76 Dave Chinner      2022-04-14  638  		break;
f2d5674061121e Allison Henderson 2022-04-11  639  =

f027184d93cf76 Dave Chinner      2022-04-14  640  	case XFS_DAS_LEAF_REMOVE=
_OLD:
f027184d93cf76 Dave Chinner      2022-04-14  641  	case XFS_DAS_NODE_REMOVE=
_OLD:
83c6e70789ff37 Allison Henderson 2021-04-19  642  		/*
6e971e92677394 Dave Chinner      2022-04-14  643  		 * If we have a remote =
attr, start the process of removing it
6e971e92677394 Dave Chinner      2022-04-14  644  		 * by invalidating any =
cached buffers.
6e971e92677394 Dave Chinner      2022-04-14  645  		 *
6e971e92677394 Dave Chinner      2022-04-14  646  		 * If we don't have a r=
emote attr, we skip the remote block
6e971e92677394 Dave Chinner      2022-04-14  647  		 * removal state altoge=
ther with a second state increment.
83c6e70789ff37 Allison Henderson 2021-04-19  648  		 */
83c6e70789ff37 Allison Henderson 2021-04-19  649  		xfs_attr_restore_rmt_bl=
k(args);
6e971e92677394 Dave Chinner      2022-04-14  650  		if (args->rmtblkno) {
83c6e70789ff37 Allison Henderson 2021-04-19  651  			error =3D xfs_attr_rmt=
val_invalidate(args);
83c6e70789ff37 Allison Henderson 2021-04-19  652  			if (error)
83c6e70789ff37 Allison Henderson 2021-04-19  653  				return error;
6e971e92677394 Dave Chinner      2022-04-14  654  		} else {
6e971e92677394 Dave Chinner      2022-04-14  655  			attr->xattri_dela_stat=
e++;
6e971e92677394 Dave Chinner      2022-04-14  656  		}
83c6e70789ff37 Allison Henderson 2021-04-19  657  =

100ba63970eed9 Dave Chinner      2022-04-14  658  		attr->xattri_dela_state=
++;
6e971e92677394 Dave Chinner      2022-04-14  659  		goto next_state;
6e971e92677394 Dave Chinner      2022-04-14  660  =

6e971e92677394 Dave Chinner      2022-04-14  661  	case XFS_DAS_LEAF_REMOVE=
_RMT:
6e971e92677394 Dave Chinner      2022-04-14  662  	case XFS_DAS_NODE_REMOVE=
_RMT:
37e7bb8434f8b2 Allison Henderson 2022-04-11  663  		error =3D xfs_attr_rmtv=
al_remove(attr);
d56c93997e96ed Dave Chinner      2022-04-14  664  		if (error =3D=3D -EAGAI=
N) {
d56c93997e96ed Dave Chinner      2022-04-14  665  			error =3D 0;
6e971e92677394 Dave Chinner      2022-04-14  666  			break;
d56c93997e96ed Dave Chinner      2022-04-14  667  		}
83c6e70789ff37 Allison Henderson 2021-04-19  668  		if (error)
83c6e70789ff37 Allison Henderson 2021-04-19  669  			return error;
8f502a4009822a Allison Henderson 2021-05-21  670  =

100ba63970eed9 Dave Chinner      2022-04-14  671  		/*
6e971e92677394 Dave Chinner      2022-04-14  672  		 * We've finished remov=
ing the remote attr blocks, so commit the
6e971e92677394 Dave Chinner      2022-04-14  673  		 * transaction and move=
 on to removing the attr name from the
6e971e92677394 Dave Chinner      2022-04-14  674  		 * leaf/node block. Rem=
oving the attr might require a full
6e971e92677394 Dave Chinner      2022-04-14  675  		 * transaction reservat=
ion for btree block freeing, so we
6e971e92677394 Dave Chinner      2022-04-14  676  		 * can't do that in the=
 same transaction where we removed the
6e971e92677394 Dave Chinner      2022-04-14  677  		 * remote attr blocks.
100ba63970eed9 Dave Chinner      2022-04-14  678  		 */
100ba63970eed9 Dave Chinner      2022-04-14  679  		attr->xattri_dela_state=
++;
6e971e92677394 Dave Chinner      2022-04-14  680  		break;
100ba63970eed9 Dave Chinner      2022-04-14  681  =

e683cdbb8baf82 Dave Chinner      2022-04-14  682  	case XFS_DAS_LEAF_REMOVE=
_ATTR:
e683cdbb8baf82 Dave Chinner      2022-04-14  683  		error =3D xfs_attr_leaf=
_remove_attr(attr);
f589c4f3a7a7d6 Dave Chinner      2022-04-14  684  		attr->xattri_dela_state=
 =3D xfs_attr_complete_op(attr,
f589c4f3a7a7d6 Dave Chinner      2022-04-14  685  						xfs_attr_init_add_s=
tate(args));
e683cdbb8baf82 Dave Chinner      2022-04-14  686  		break;
5d954cc09f6bae Allison Henderson 2021-04-26  687  =

e683cdbb8baf82 Dave Chinner      2022-04-14  688  	case XFS_DAS_NODE_REMOVE=
_ATTR:
e683cdbb8baf82 Dave Chinner      2022-04-14  689  		error =3D xfs_attr_node=
_remove_attr(attr);
f589c4f3a7a7d6 Dave Chinner      2022-04-14  690  		attr->xattri_dela_state=
 =3D xfs_attr_complete_op(attr,
f589c4f3a7a7d6 Dave Chinner      2022-04-14  691  						xfs_attr_init_add_s=
tate(args));
8f502a4009822a Allison Henderson 2021-05-21  692  		break;
8f502a4009822a Allison Henderson 2021-05-21  693  	default:
4a4957c16dc674 Allison Henderson 2021-05-21  694  		ASSERT(0);
8f502a4009822a Allison Henderson 2021-05-21  695  		break;
8f502a4009822a Allison Henderson 2021-05-21  696  	}
020dee1bf99e76 Dave Chinner      2022-04-14  697  =

020dee1bf99e76 Dave Chinner      2022-04-14  698  	trace_xfs_attr_set_iter_=
return(attr->xattri_dela_state, args->dp);
6ca5a4a1f52952 Allison Henderson 2021-04-12  699  	return error;
2f3cd809196381 Allison Henderson 2018-10-18  700  }
2f3cd809196381 Allison Henderson 2018-10-18  701  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4557808674434518574==--

