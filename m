Content-Type: multipart/mixed; boundary="===============4387476256866071976=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [dgc-xfs:xfs-5.19-compose 46/86] fs/xfs/xfs_attr_item.c:401:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Tue, 12 Apr 2022 11:55:57 +0800
Message-ID: <202204121159.u6SxXaa7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4387476256866071976==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Dave Chinner <david@fromorbit.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dgc/linux-xfs.git x=
fs-5.19-compose
head:   94f0889f7a0ffa0376c59381537cb14fdd0cc3c5
commit: 7e142753c9aa0ea14acaacbd8b728d26f1b0c951 [46/86] xfs: Implement att=
r logging and replay
:::::: branch date: 24 hours ago
:::::: commit date: 25 hours ago
config: arm-randconfig-c002-20220411 (https://download.01.org/0day-ci/archi=
ve/20220412/202204121159.u6SxXaa7-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c6e83f=
560f06cdfe8aa47b248d8bdc58f947274b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/dgc/linux-xfs.git=
/commit/?id=3D7e142753c9aa0ea14acaacbd8b728d26f1b0c951
        git remote add dgc-xfs https://git.kernel.org/pub/scm/linux/kernel/=
git/dgc/linux-xfs.git
        git fetch --no-tags dgc-xfs xfs-5.19-compose
        git checkout 7e142753c9aa0ea14acaacbd8b728d26f1b0c951
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:46:30: note: expanded from macro '__under=
lying_memmove'
   #define __underlying_memmove    __builtin_memmove
                                   ^~~~~~~~~~~~~~~~~
   lib/lz4/lz4_compress.c:848:2: note: Call to function 'memmove' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memmove_s' in case of C11
           memmove(safeBuffer, previousDictEnd - dictSize, dictSize);
           ^
   include/linux/fortify-string.h:373:27: note: expanded from macro 'memmov=
e'
   #define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:46:30: note: expanded from macro '__under=
lying_memmove'
   #define __underlying_memmove    __builtin_memmove
                                   ^~~~~~~~~~~~~~~~~
   Suppressed 18 warnings (17 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   62 warnings generated.
   fs/xfs/xfs_attr_item.c:227:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy((char *)dst_attr_fmt, (char *)src_attr_fmt, len);
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
   fs/xfs/xfs_attr_item.c:227:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy((char *)dst_attr_fmt, (char *)src_attr_fmt, len);
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
   fs/xfs/xfs_attr_item.c:362:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(attrip->attri_name, attr->xattri_dac.da_args->name,
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
   fs/xfs/xfs_attr_item.c:362:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(attrip->attri_name, attr->xattri_dac.da_args->name,
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
   fs/xfs/xfs_attr_item.c:364:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(attrip->attri_value, attr->xattri_dac.da_args->value,
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
   fs/xfs/xfs_attr_item.c:364:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(attrip->attri_value, attr->xattri_dac.da_args->value,
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
>> fs/xfs/xfs_attr_item.c:401:2: warning: Undefined or garbage value return=
ed to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return &attrip->attri_item;
           ^      ~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_attr_item.c:379:2: note: 'attrip' declared without an initial=
 value
           struct xfs_attri_log_item       *attrip;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_attr_item.c:382:9: note: Assuming 'count' is equal to 1
           ASSERT(count =3D=3D 1);
                  ^
   fs/xfs/xfs_linux.h:206:10: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : assfail(NULL, #expr, __FILE__, __LINE_=
_))
                   ^~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   fs/xfs/xfs_attr_item.c:382:2: note: '?' condition is true
           ASSERT(count =3D=3D 1);
           ^
   fs/xfs/xfs_linux.h:206:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : assfail(NULL, #expr, __FILE__, __LINE_=
_))
            ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^
   fs/xfs/xfs_attr_item.c:384:6: note: Assuming the condition is false
           if (!xfs_sb_version_haslogxattrs(&mp->m_sb))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_attr_item.c:384:2: note: Taking false branch
           if (!xfs_sb_version_haslogxattrs(&mp->m_sb))
           ^
   fs/xfs/xfs_attr_item.c:391:2: note: Loop condition is false. Execution c=
ontinues on line 401
           list_for_each_entry(attr, items, xattri_list) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   fs/xfs/xfs_attr_item.c:401:2: note: Undefined or garbage value returned =
to caller
           return &attrip->attri_item;
           ^      ~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_attr_item.c:644:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(new_attrip->attri_name, old_attrip->attri_name,
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
   fs/xfs/xfs_attr_item.c:644:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(new_attrip->attri_name, old_attrip->attri_name,
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
   fs/xfs/xfs_attr_item.c:648:3: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(new_attrip->attri_value, old_attrip->attri_value,
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
   fs/xfs/xfs_attr_item.c:648:3: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
                   memcpy(new_attrip->attri_value, old_attrip->attri_value,
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
   fs/xfs/xfs_attr_item.c:690:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(attrip->attri_name, item->ri_buf[region].i_addr,
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here

vim +401 fs/xfs/xfs_attr_item.c

7e142753c9aa0ea Allison Henderson 2022-04-11  369  =

7e142753c9aa0ea Allison Henderson 2022-04-11  370  /* Get an ATTRI. */
7e142753c9aa0ea Allison Henderson 2022-04-11  371  static struct xfs_log_it=
em *
7e142753c9aa0ea Allison Henderson 2022-04-11  372  xfs_attr_create_intent(
7e142753c9aa0ea Allison Henderson 2022-04-11  373  	struct xfs_trans		*tp,
7e142753c9aa0ea Allison Henderson 2022-04-11  374  	struct list_head		*item=
s,
7e142753c9aa0ea Allison Henderson 2022-04-11  375  	unsigned int			count,
7e142753c9aa0ea Allison Henderson 2022-04-11  376  	bool				sort)
7e142753c9aa0ea Allison Henderson 2022-04-11  377  {
7e142753c9aa0ea Allison Henderson 2022-04-11  378  	struct xfs_mount		*mp =
=3D tp->t_mountp;
7e142753c9aa0ea Allison Henderson 2022-04-11  379  	struct xfs_attri_log_it=
em	*attrip;
7e142753c9aa0ea Allison Henderson 2022-04-11  380  	struct xfs_attr_item		*=
attr;
7e142753c9aa0ea Allison Henderson 2022-04-11  381  =

7e142753c9aa0ea Allison Henderson 2022-04-11  382  	ASSERT(count =3D=3D 1);
7e142753c9aa0ea Allison Henderson 2022-04-11  383  =

7e142753c9aa0ea Allison Henderson 2022-04-11  384  	if (!xfs_sb_version_has=
logxattrs(&mp->m_sb))
7e142753c9aa0ea Allison Henderson 2022-04-11  385  		return NULL;
7e142753c9aa0ea Allison Henderson 2022-04-11  386  =

7e142753c9aa0ea Allison Henderson 2022-04-11  387  	/*
7e142753c9aa0ea Allison Henderson 2022-04-11  388  	 * Each attr item only =
performs one attribute operation at a time, so
7e142753c9aa0ea Allison Henderson 2022-04-11  389  	 * this is a list of one
7e142753c9aa0ea Allison Henderson 2022-04-11  390  	 */
7e142753c9aa0ea Allison Henderson 2022-04-11  391  	list_for_each_entry(att=
r, items, xattri_list) {
7e142753c9aa0ea Allison Henderson 2022-04-11  392  		attrip =3D xfs_attri_i=
nit(mp, attr->xattri_dac.da_args->namelen,
7e142753c9aa0ea Allison Henderson 2022-04-11  393  					attr->xattri_dac.da=
_args->valuelen);
7e142753c9aa0ea Allison Henderson 2022-04-11  394  		if (attrip =3D=3D NULL)
7e142753c9aa0ea Allison Henderson 2022-04-11  395  			return NULL;
7e142753c9aa0ea Allison Henderson 2022-04-11  396  =

7e142753c9aa0ea Allison Henderson 2022-04-11  397  		xfs_trans_add_item(tp,=
 &attrip->attri_item);
7e142753c9aa0ea Allison Henderson 2022-04-11  398  		xfs_attr_log_item(tp, =
attrip, attr);
7e142753c9aa0ea Allison Henderson 2022-04-11  399  	}
7e142753c9aa0ea Allison Henderson 2022-04-11  400  =

7e142753c9aa0ea Allison Henderson 2022-04-11 @401  	return &attrip->attri_i=
tem;
7e142753c9aa0ea Allison Henderson 2022-04-11  402  }
7e142753c9aa0ea Allison Henderson 2022-04-11  403  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4387476256866071976==--

