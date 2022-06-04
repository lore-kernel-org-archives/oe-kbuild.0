Content-Type: multipart/mixed; boundary="===============2533006945451523125=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH v2] vdpa: Do not count the pages that were already pinned in the vhost-vDPA
Date: Sun, 05 Jun 2022 00:04:51 +0800
Message-ID: <202206042319.frgBEFEG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2533006945451523125==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/v=
host/vdpa.c:614:2: warning: Value stored to 'range_size' is never read [cla=
ng-analyzer-deadcode.DeadStores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220601012019.1102186-1-lulu@redhat.com>
References: <20220601012019.1102186-1-lulu@redhat.com>
TO: Cindy Lu <lulu@redhat.com>

Hi Cindy,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on v5.18]
[cannot apply to mst-vhost/linux-next next-20220603]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Cindy-Lu/vdpa-Do-not=
-count-the-pages-that-were-already-pinned-in-the-vhost-vDPA/20220601-092308
base:    4b0986a3613c92f4ec1bdc7f60ec66fea135991f
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
604/202206042319.frgBEFEG-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825ab=
d6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8f0b25afe9ac570a70e=
afb5c285747e3bdd2471d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Cindy-Lu/vdpa-Do-not-count-the-pag=
es-that-were-already-pinned-in-the-vhost-vDPA/20220601-092308
        git checkout 8f0b25afe9ac570a70eafb5c285747e3bdd2471d
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   net/ipv6/addrconf.c:7150:4: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                           memcpy(dflt,
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 106 warnings (106 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/md/dm-thin.c:1269:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(m, 0, sizeof(struct dm_thin_new_mapping));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/md/dm-thin.c:1269:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(m, 0, sizeof(struct dm_thin_new_mapping));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/md/dm-thin.c:3990:10: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                          format_dev_t(buf, pt->metadata_dev->bdev->bd_dev),
                          ^
   include/linux/kdev_t.h:19:3: note: expanded from macro 'format_dev_t'
                   sprintf(buffer, "%u:%u", MAJOR(dev), MINOR(dev));       \
                   ^~~~~~~
   include/linux/device-mapper.h:600:46: note: expanded from macro 'DMEMIT'
                             0 : scnprintf(result + sz, maxlen - sz, x))
                                                                     ^
   drivers/md/dm-thin.c:3990:10: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                          format_dev_t(buf, pt->metadata_dev->bdev->bd_dev),
                          ^
   include/linux/kdev_t.h:19:3: note: expanded from macro 'format_dev_t'
                   sprintf(buffer, "%u:%u", MAJOR(dev), MINOR(dev));       \
                   ^~~~~~~
   include/linux/device-mapper.h:600:46: note: expanded from macro 'DMEMIT'
                             0 : scnprintf(result + sz, maxlen - sz, x))
                                                                     ^
   drivers/md/dm-thin.c:3991:10: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                          format_dev_t(buf2, pt->data_dev->bdev->bd_dev),
                          ^
   include/linux/kdev_t.h:19:3: note: expanded from macro 'format_dev_t'
                   sprintf(buffer, "%u:%u", MAJOR(dev), MINOR(dev));       \
                   ^~~~~~~
   include/linux/device-mapper.h:600:46: note: expanded from macro 'DMEMIT'
                             0 : scnprintf(result + sz, maxlen - sz, x))
                                                                     ^
   drivers/md/dm-thin.c:3991:10: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                          format_dev_t(buf2, pt->data_dev->bdev->bd_dev),
                          ^
   include/linux/kdev_t.h:19:3: note: expanded from macro 'format_dev_t'
                   sprintf(buffer, "%u:%u", MAJOR(dev), MINOR(dev));       \
                   ^~~~~~~
   include/linux/device-mapper.h:600:46: note: expanded from macro 'DMEMIT'
                             0 : scnprintf(result + sz, maxlen - sz, x))
                                                                     ^
   drivers/md/dm-thin.c:4407:11: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                  format_dev_t(buf, tc->pool_dev->bdev->bd_=
dev),
                                  ^
   include/linux/kdev_t.h:19:3: note: expanded from macro 'format_dev_t'
                   sprintf(buffer, "%u:%u", MAJOR(dev), MINOR(dev));       \
                   ^~~~~~~
   include/linux/device-mapper.h:600:46: note: expanded from macro 'DMEMIT'
                             0 : scnprintf(result + sz, maxlen - sz, x))
                                                                     ^
   drivers/md/dm-thin.c:4407:11: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                                  format_dev_t(buf, tc->pool_dev->bdev->bd_=
dev),
                                  ^
   include/linux/kdev_t.h:19:3: note: expanded from macro 'format_dev_t'
                   sprintf(buffer, "%u:%u", MAJOR(dev), MINOR(dev));       \
                   ^~~~~~~
   include/linux/device-mapper.h:600:46: note: expanded from macro 'DMEMIT'
                             0 : scnprintf(result + sz, maxlen - sz, x))
                                                                     ^
   drivers/md/dm-thin.c:4410:19: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   DMEMIT(" %s", format_dev_t(buf, tc->orig=
in_dev->bdev->bd_dev));
                                                 ^
   include/linux/kdev_t.h:19:3: note: expanded from macro 'format_dev_t'
                   sprintf(buffer, "%u:%u", MAJOR(dev), MINOR(dev));       \
                   ^~~~~~~
   include/linux/device-mapper.h:600:46: note: expanded from macro 'DMEMIT'
                             0 : scnprintf(result + sz, maxlen - sz, x))
                                                                     ^
   drivers/md/dm-thin.c:4410:19: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                                   DMEMIT(" %s", format_dev_t(buf, tc->orig=
in_dev->bdev->bd_dev));
                                                 ^
   include/linux/kdev_t.h:19:3: note: expanded from macro 'format_dev_t'
                   sprintf(buffer, "%u:%u", MAJOR(dev), MINOR(dev));       \
                   ^~~~~~~
   include/linux/device-mapper.h:600:46: note: expanded from macro 'DMEMIT'
                             0 : scnprintf(result + sz, maxlen - sz, x))
                                                                     ^
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   84 warnings generated.
>> drivers/vhost/vdpa.c:614:2: warning: Value stored to 'range_size' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           range_size =3D range_start - range_last;
           ^            ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vhost/vdpa.c:614:2: note: Value stored to 'range_size' is never =
read
           range_size =3D range_start - range_last;
           ^            ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vhost/vdpa.c:719:40: warning: The right operand of '>=3D' is a g=
arbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if ((range_size >=3D 0) && (range_start >=3D node_last) &&
                                                 ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/vhost/vdpa.c:596:2: note: 'node_last' declared without an initia=
l value
           u64 node_last;
           ^~~~~~~~~~~~~
   drivers/vhost/vdpa.c:604:6: note: Assuming 'node_number' is not equal to=
 0
           if (node_number =3D=3D 0) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/vhost/vdpa.c:604:2: note: '?' condition is false
           if (node_number =3D=3D 0) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/vhost/vdpa.c:604:6: note: 'node_number' is not equal to 0
           if (node_number =3D=3D 0) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/vhost/vdpa.c:604:2: note: '?' condition is false
           if (node_number =3D=3D 0) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/vhost/vdpa.c:604:2: note: Taking false branch
           if (node_number =3D=3D 0) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/vhost/vdpa.c:615:14: note: Assuming 'i' is >=3D 'node_number'
           for (i =3D 0; i < node_number; i++) {
                       ^~~~~~~~~~~~~~~
   drivers/vhost/vdpa.c:615:2: note: Loop condition is false. Execution con=
tinues on line 715
           for (i =3D 0; i < node_number; i++) {
           ^
   drivers/vhost/vdpa.c:719:7: note: Assuming 'range_size' is >=3D 0
           if ((range_size >=3D 0) && (range_start >=3D node_last) &&
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/vhost/vdpa.c:719:6: note: Left side of '&&' is true
           if ((range_size >=3D 0) && (range_start >=3D node_last) &&
               ^
   drivers/vhost/vdpa.c:719:40: note: The right operand of '>=3D' is a garb=
age value
           if ((range_size >=3D 0) && (range_start >=3D node_last) &&
                                                 ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
>> drivers/vhost/vdpa.c:978:16: warning: Assigned value is garbage or undef=
ined [clang-analyzer-core.uninitialized.Assign]
           pre_link_node =3D link_head_tmp;
                         ^
   drivers/vhost/vdpa.c:1589:2: note: Calling 'vhost_vdpa_iotlb_free'
           vhost_vdpa_iotlb_free(v);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vhost/vdpa.c:1065:2: note: Calling 'vhost_vdpa_iotlb_unmap'
           vhost_vdpa_iotlb_unmap(v, 0ULL, 0ULL - 1);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vhost/vdpa.c:1055:2: note: Assuming field 'use_va' is false
           if (vdpa->use_va)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/vhost/vdpa.c:1055:2: note: '?' condition is false
           if (vdpa->use_va)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/vhost/vdpa.c:1055:12: note: Field 'use_va' is false
           if (vdpa->use_va)
                     ^
   drivers/vhost/vdpa.c:1055:2: note: '?' condition is false
           if (vdpa->use_va)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/vhost/vdpa.c:1055:2: note: Taking false branch
           if (vdpa->use_va)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/vhost/vdpa.c:1058:9: note: Calling 'vhost_vdpa_pa_unmap'
           return vhost_vdpa_pa_unmap(v, start, last);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vhost/vdpa.c:1018:9: note: Assuming the condition is true
           while ((map =3D vhost_iotlb_itree_first(iotlb, start, last)) !=
=3D NULL) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/vhost/vdpa.c:1018:2: note: Loop condition is true.  Entering loo=
p body
           while ((map =3D vhost_iotlb_itree_first(iotlb, start, last)) !=
=3D NULL) {
           ^
   drivers/vhost/vdpa.c:1021:8: note: Assuming 'pinned' is <=3D 0
                        pinned > 0; pfn++, pinned--) {
                        ^~~~~~~~~~
   drivers/vhost/vdpa.c:1020:3: note: Loop condition is false. Execution co=
ntinues on line 1028
                   for (pfn =3D PFN_DOWN(map->addr);
                   ^
   drivers/vhost/vdpa.c:1028:10: note: Calling 'vhost_vdpa_search_range_del'
                   size =3D vhost_vdpa_search_range_del(dev->vdpa_mem_tree,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vhost/vdpa.c:1004:9: note: Calling 'vhost_vdpa_range_ops'
           size =3D vhost_vdpa_range_ops(root, start, last, false);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vhost/vdpa.c:941:2: note: 'link_head_tmp' declared without an in=
itial value
           struct vdpa_link_node *link_head_tmp;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vhost/vdpa.c:946:2: note: Loop condition is true.  Entering loop=
 body
           for (node =3D interval_tree_iter_first(root, start, last); node;
           ^
   drivers/vhost/vdpa.c:949:7: note: Assuming 'link_node' is equal to null
                   if (link_node =3D=3D NULL) {
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/vhost/vdpa.c:949:3: note: '?' condition is false
                   if (link_node =3D=3D NULL) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/vhost/vdpa.c:949:7: note: 'link_node' is equal to null
                   if (link_node =3D=3D NULL) {
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))

vim +/range_size +614 drivers/vhost/vdpa.c

8f0b25afe9ac57 Cindy Lu 2022-06-01  587  =

8f0b25afe9ac57 Cindy Lu 2022-06-01  588  u64 vhost_vdpa_range_ref_add(struc=
t rb_root_cached *root,
8f0b25afe9ac57 Cindy Lu 2022-06-01  589  			     struct vdpa_link_node *lin=
k_head, int node_number,
8f0b25afe9ac57 Cindy Lu 2022-06-01  590  			     u64 start, u64 last)
8f0b25afe9ac57 Cindy Lu 2022-06-01  591  {
8f0b25afe9ac57 Cindy Lu 2022-06-01  592  	int i =3D 0;
8f0b25afe9ac57 Cindy Lu 2022-06-01  593  	u64 size =3D 0;
8f0b25afe9ac57 Cindy Lu 2022-06-01  594  	int new_ref;
8f0b25afe9ac57 Cindy Lu 2022-06-01  595  	u64 node_start;
8f0b25afe9ac57 Cindy Lu 2022-06-01  596  	u64 node_last;
8f0b25afe9ac57 Cindy Lu 2022-06-01  597  	u64 range_start;
8f0b25afe9ac57 Cindy Lu 2022-06-01  598  	u64 range_last;
8f0b25afe9ac57 Cindy Lu 2022-06-01  599  	int range_size;
8f0b25afe9ac57 Cindy Lu 2022-06-01  600  	struct vdpa_link_node *link_node;
8f0b25afe9ac57 Cindy Lu 2022-06-01  601  	struct vdpa_tree_node *vdpa_node =
=3D NULL;
8f0b25afe9ac57 Cindy Lu 2022-06-01  602  	struct interval_tree_node *node =
=3D NULL;
8f0b25afe9ac57 Cindy Lu 2022-06-01  603  =

8f0b25afe9ac57 Cindy Lu 2022-06-01  604  	if (node_number =3D=3D 0) {
8f0b25afe9ac57 Cindy Lu 2022-06-01  605  		vhost_vdpa_add_range_ctx(root, s=
tart, last, 1);
8f0b25afe9ac57 Cindy Lu 2022-06-01  606  =

8f0b25afe9ac57 Cindy Lu 2022-06-01  607  		size =3D last - start + 1;
8f0b25afe9ac57 Cindy Lu 2022-06-01  608  		return size;
8f0b25afe9ac57 Cindy Lu 2022-06-01  609  	}
8f0b25afe9ac57 Cindy Lu 2022-06-01  610  =

8f0b25afe9ac57 Cindy Lu 2022-06-01  611  	link_node =3D link_head;
8f0b25afe9ac57 Cindy Lu 2022-06-01  612  	range_start =3D start;
8f0b25afe9ac57 Cindy Lu 2022-06-01  613  	range_last =3D last;
8f0b25afe9ac57 Cindy Lu 2022-06-01 @614  	range_size =3D range_start - rang=
e_last;
8f0b25afe9ac57 Cindy Lu 2022-06-01  615  	for (i =3D 0; i < node_number; i+=
+) {
8f0b25afe9ac57 Cindy Lu 2022-06-01  616  		vdpa_node =3D link_node->vdpa_no=
de;
8f0b25afe9ac57 Cindy Lu 2022-06-01  617  		link_node =3D link_node->next;
8f0b25afe9ac57 Cindy Lu 2022-06-01  618  		node =3D &vdpa_node->tree_node;
8f0b25afe9ac57 Cindy Lu 2022-06-01  619  		new_ref =3D vdpa_node->ref;
8f0b25afe9ac57 Cindy Lu 2022-06-01  620  		node_start =3D node->start;
8f0b25afe9ac57 Cindy Lu 2022-06-01  621  		node_last =3D node->last;
8f0b25afe9ac57 Cindy Lu 2022-06-01  622  =

8f0b25afe9ac57 Cindy Lu 2022-06-01  623  		if (range_start =3D=3D node_star=
t) {
8f0b25afe9ac57 Cindy Lu 2022-06-01  624  			if (node_last < range_last) {
8f0b25afe9ac57 Cindy Lu 2022-06-01  625  				/* range_start=3D node->start-=
-- node->last--range_last*/
8f0b25afe9ac57 Cindy Lu 2022-06-01  626  				vhost_vdpa_add_range_ctx(root,=
 node_start,
8f0b25afe9ac57 Cindy Lu 2022-06-01  627  							 node_last,
8f0b25afe9ac57 Cindy Lu 2022-06-01  628  							 new_ref + 1);
8f0b25afe9ac57 Cindy Lu 2022-06-01  629  				/*count the next range */
8f0b25afe9ac57 Cindy Lu 2022-06-01  630  			} else if (node_last > range_la=
st) {
8f0b25afe9ac57 Cindy Lu 2022-06-01  631  				/* range_start=3D node->start	=
---  last --  node->last*/
8f0b25afe9ac57 Cindy Lu 2022-06-01  632  				vhost_vdpa_add_range_ctx(root,=
 node_start,
8f0b25afe9ac57 Cindy Lu 2022-06-01  633  							 range_last,
8f0b25afe9ac57 Cindy Lu 2022-06-01  634  							 new_ref + 1);
8f0b25afe9ac57 Cindy Lu 2022-06-01  635  				vhost_vdpa_add_range_ctx(root,=
 range_last + 1,
8f0b25afe9ac57 Cindy Lu 2022-06-01  636  							 node_last, new_ref);
8f0b25afe9ac57 Cindy Lu 2022-06-01  637  			} else {
8f0b25afe9ac57 Cindy Lu 2022-06-01  638  				vhost_vdpa_add_range_ctx(root,=
 node_start,
8f0b25afe9ac57 Cindy Lu 2022-06-01  639  							 node_last,
8f0b25afe9ac57 Cindy Lu 2022-06-01  640  							 new_ref + 1);
8f0b25afe9ac57 Cindy Lu 2022-06-01  641  			}
8f0b25afe9ac57 Cindy Lu 2022-06-01  642  		} else if (node_start < range_st=
art) {
8f0b25afe9ac57 Cindy Lu 2022-06-01  643  			if (range_last < node_last) {
8f0b25afe9ac57 Cindy Lu 2022-06-01  644  				/* node->start---  start--- la=
st--- node->last*/
8f0b25afe9ac57 Cindy Lu 2022-06-01  645  				/* should the end rang*/
8f0b25afe9ac57 Cindy Lu 2022-06-01  646  =

8f0b25afe9ac57 Cindy Lu 2022-06-01  647  				vhost_vdpa_add_range_ctx(root,=
 node_start,
8f0b25afe9ac57 Cindy Lu 2022-06-01  648  							 range_start - 1,
8f0b25afe9ac57 Cindy Lu 2022-06-01  649  							 new_ref);
8f0b25afe9ac57 Cindy Lu 2022-06-01  650  				vhost_vdpa_add_range_ctx(root,=
 range_start,
8f0b25afe9ac57 Cindy Lu 2022-06-01  651  							 range_last,
8f0b25afe9ac57 Cindy Lu 2022-06-01  652  							 new_ref + 1);
8f0b25afe9ac57 Cindy Lu 2022-06-01  653  				vhost_vdpa_add_range_ctx(root,=
 range_last + 1,
8f0b25afe9ac57 Cindy Lu 2022-06-01  654  							 node_last, new_ref);
8f0b25afe9ac57 Cindy Lu 2022-06-01  655  =

8f0b25afe9ac57 Cindy Lu 2022-06-01  656  			} else if (range_last > node_la=
st) {
8f0b25afe9ac57 Cindy Lu 2022-06-01  657  				/* node->start---  start--- no=
de->last-- last*/
8f0b25afe9ac57 Cindy Lu 2022-06-01  658  =

8f0b25afe9ac57 Cindy Lu 2022-06-01  659  				vhost_vdpa_add_range_ctx(root,=
 node_start,
8f0b25afe9ac57 Cindy Lu 2022-06-01  660  							 range_start - 1,
8f0b25afe9ac57 Cindy Lu 2022-06-01  661  							 new_ref);
8f0b25afe9ac57 Cindy Lu 2022-06-01  662  				vhost_vdpa_add_range_ctx(root,=
 range_start,
8f0b25afe9ac57 Cindy Lu 2022-06-01  663  							 node_last,
8f0b25afe9ac57 Cindy Lu 2022-06-01  664  							 new_ref + 1);
8f0b25afe9ac57 Cindy Lu 2022-06-01  665  			} else {
8f0b25afe9ac57 Cindy Lu 2022-06-01  666  				/* node->start---  start--- no=
de->last=3D last*/
8f0b25afe9ac57 Cindy Lu 2022-06-01  667  				vhost_vdpa_add_range_ctx(root,=
 node_start,
8f0b25afe9ac57 Cindy Lu 2022-06-01  668  							 range_start - 1,
8f0b25afe9ac57 Cindy Lu 2022-06-01  669  							 new_ref);
8f0b25afe9ac57 Cindy Lu 2022-06-01  670  				vhost_vdpa_add_range_ctx(root,=
 range_start,
8f0b25afe9ac57 Cindy Lu 2022-06-01  671  							 node_last,
8f0b25afe9ac57 Cindy Lu 2022-06-01  672  							 new_ref + 1);
8f0b25afe9ac57 Cindy Lu 2022-06-01  673  				/* should the end rang*/
8f0b25afe9ac57 Cindy Lu 2022-06-01  674  			}
8f0b25afe9ac57 Cindy Lu 2022-06-01  675  		} else {
8f0b25afe9ac57 Cindy Lu 2022-06-01  676  			if (node_last < range_last) {
8f0b25afe9ac57 Cindy Lu 2022-06-01  677  				/* range_start --- node->start=
 --- node->last ----last  */
8f0b25afe9ac57 Cindy Lu 2022-06-01  678  =

8f0b25afe9ac57 Cindy Lu 2022-06-01  679  				vhost_vdpa_add_range_ctx(root,=
 range_start,
8f0b25afe9ac57 Cindy Lu 2022-06-01  680  							 node_start - 1, 1);
8f0b25afe9ac57 Cindy Lu 2022-06-01  681  				vhost_vdpa_add_range_ctx(root,=
 node_start,
8f0b25afe9ac57 Cindy Lu 2022-06-01  682  							 node_last,
8f0b25afe9ac57 Cindy Lu 2022-06-01  683  							 new_ref + 1);
8f0b25afe9ac57 Cindy Lu 2022-06-01  684  				size +=3D ((node_start - 1) - =
range_start) + 1;
8f0b25afe9ac57 Cindy Lu 2022-06-01  685  			} else if (node_last > range_la=
st) {
8f0b25afe9ac57 Cindy Lu 2022-06-01  686  				/* range_start--- node->start	=
---  last --  node->last	*/
8f0b25afe9ac57 Cindy Lu 2022-06-01  687  				vhost_vdpa_add_range_ctx(root,=
 range_start,
8f0b25afe9ac57 Cindy Lu 2022-06-01  688  							 node_start - 1, 1);
8f0b25afe9ac57 Cindy Lu 2022-06-01  689  				vhost_vdpa_add_range_ctx(root,=
 node_start,
8f0b25afe9ac57 Cindy Lu 2022-06-01  690  							 range_last,
8f0b25afe9ac57 Cindy Lu 2022-06-01  691  							 new_ref + 1);
8f0b25afe9ac57 Cindy Lu 2022-06-01  692  				vhost_vdpa_add_range_ctx(root,=
 range_last + 1,
8f0b25afe9ac57 Cindy Lu 2022-06-01  693  							 node_last, new_ref);
8f0b25afe9ac57 Cindy Lu 2022-06-01  694  				size +=3D ((node_start - 1) - =
range_start) + 1;
8f0b25afe9ac57 Cindy Lu 2022-06-01  695  =

8f0b25afe9ac57 Cindy Lu 2022-06-01  696  				/* should the end rang*/
8f0b25afe9ac57 Cindy Lu 2022-06-01  697  			} else {
8f0b25afe9ac57 Cindy Lu 2022-06-01  698  				/* range_start--- node->start	=
---  last =3D  node->last	*/
8f0b25afe9ac57 Cindy Lu 2022-06-01  699  				vhost_vdpa_add_range_ctx(root,=
 range_start,
8f0b25afe9ac57 Cindy Lu 2022-06-01  700  							 node_start - 1, 1);
8f0b25afe9ac57 Cindy Lu 2022-06-01  701  				vhost_vdpa_add_range_ctx(root,=
 node_start,
8f0b25afe9ac57 Cindy Lu 2022-06-01  702  							 node_last,
8f0b25afe9ac57 Cindy Lu 2022-06-01  703  							 new_ref + 1);
8f0b25afe9ac57 Cindy Lu 2022-06-01  704  				size +=3D ((node_start - 1) - =
range_start) + 1;
8f0b25afe9ac57 Cindy Lu 2022-06-01  705  =

8f0b25afe9ac57 Cindy Lu 2022-06-01  706  				/* should the end rang*/
8f0b25afe9ac57 Cindy Lu 2022-06-01  707  			}
8f0b25afe9ac57 Cindy Lu 2022-06-01  708  		}
8f0b25afe9ac57 Cindy Lu 2022-06-01  709  		/* work in next node*/
8f0b25afe9ac57 Cindy Lu 2022-06-01  710  		range_start =3D node_last + 1;
8f0b25afe9ac57 Cindy Lu 2022-06-01  711  		if (range_start > range_last)
8f0b25afe9ac57 Cindy Lu 2022-06-01  712  			break;
8f0b25afe9ac57 Cindy Lu 2022-06-01  713  	}
8f0b25afe9ac57 Cindy Lu 2022-06-01  714  =

8f0b25afe9ac57 Cindy Lu 2022-06-01  715  	range_size =3D range_last - range=
_start;
8f0b25afe9ac57 Cindy Lu 2022-06-01  716  =

8f0b25afe9ac57 Cindy Lu 2022-06-01  717  	/* last round and still some rang=
e*/
8f0b25afe9ac57 Cindy Lu 2022-06-01  718  =

8f0b25afe9ac57 Cindy Lu 2022-06-01  719  	if ((range_size >=3D 0) && (range=
_start >=3D node_last) &&
8f0b25afe9ac57 Cindy Lu 2022-06-01  720  	    (node_number =3D=3D i + 1)) {
8f0b25afe9ac57 Cindy Lu 2022-06-01  721  		vhost_vdpa_add_range_ctx(root, r=
ange_start, range_last, 1);
8f0b25afe9ac57 Cindy Lu 2022-06-01  722  		size =3D size + (range_last - ra=
nge_start) + 1;
8f0b25afe9ac57 Cindy Lu 2022-06-01  723  	} else if ((range_size =3D=3D -1)=
 && (node_number =3D=3D i + 1)) {
8f0b25afe9ac57 Cindy Lu 2022-06-01  724  		return size;
8f0b25afe9ac57 Cindy Lu 2022-06-01  725  	} else {
8f0b25afe9ac57 Cindy Lu 2022-06-01  726  		printk(KERN_WARNING,
8f0b25afe9ac57 Cindy Lu 2022-06-01  727  		       "%s %d FAIL start %lld la=
st %lld node->start %lld  node->last %lld i  %d",
8f0b25afe9ac57 Cindy Lu 2022-06-01  728  		       __func__, __LINE__, range=
_start, range_last, node_start,
8f0b25afe9ac57 Cindy Lu 2022-06-01  729  		       node_last, i);
8f0b25afe9ac57 Cindy Lu 2022-06-01  730  	}
8f0b25afe9ac57 Cindy Lu 2022-06-01  731  =

8f0b25afe9ac57 Cindy Lu 2022-06-01  732  	return size;
8f0b25afe9ac57 Cindy Lu 2022-06-01  733  }
8f0b25afe9ac57 Cindy Lu 2022-06-01  734  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2533006945451523125==--

