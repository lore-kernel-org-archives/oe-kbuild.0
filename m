Content-Type: multipart/mixed; boundary="===============7922802706216931787=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/mga/mga_dma.c:267:15: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Thu, 09 Dec 2021 13:31:46 +0800
Message-ID: <202112091348.AJ7L2325-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7922802706216931787==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2a987e65025e2b79c6d453b78cb5985ac6e5eb26
commit: a52f8a59aef46b59753e583bf4b28fccb069ce64 fortify: Explicitly disabl=
e Clang support
date:   3 months ago
:::::: branch date: 30 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-c001-20211208 (https://download.01.org/0day-ci/arch=
ive/20211209/202112091348.AJ7L2325-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da52f8a59aef46b59753e583bf4b28fccb069ce64
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a52f8a59aef46b59753e583bf4b28fccb069ce64
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/acpi/property.c:614:2: note: Loop condition is true.  Entering l=
oop body
           fwnode_for_each_child_node(fwnode, child) {
           ^
   include/linux/property.h:100:2: note: expanded from macro 'fwnode_for_ea=
ch_child_node'
           for (child =3D fwnode_get_next_child_node(fwnode, NULL); child; =
  \
           ^
   drivers/acpi/property.c:615:3: note: '?' condition is false
                   if (is_acpi_data_node(child)) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/acpi/property.c:615:3: note: Assuming the condition is true
                   if (is_acpi_data_node(child)) {
                   ^
   include/linux/compiler.h:56:44: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ~~~~=
~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/acpi/property.c:615:3: note: '?' condition is true
                   if (is_acpi_data_node(child)) {
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
   drivers/acpi/property.c:615:3: note: Taking true branch
                   if (is_acpi_data_node(child)) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/acpi/property.c:616:8: note: Calling 'acpi_data_node_match'
                           if (acpi_data_node_match(child, childname))
                               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   include/acpi/acpi_bus.h:442:9: note: Assuming the condition is true
           return is_acpi_data_node(fwnode) ?
                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:442:9: note: '?' condition is true
   include/acpi/acpi_bus.h:443:12: note: Assuming the condition is false
                   (!strcmp(to_acpi_data_node(fwnode)->name, name)) : false;
                            ^
   include/acpi/acpi_bus.h:427:3: note: expanded from macro 'to_acpi_data_n=
ode'
                   is_acpi_data_node(__to_acpi_data_node_fwnode) ?         \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:443:12: note: '?' condition is false
                   (!strcmp(to_acpi_data_node(fwnode)->name, name)) : false;
                            ^
   include/acpi/acpi_bus.h:427:3: note: expanded from macro 'to_acpi_data_n=
ode'
                   is_acpi_data_node(__to_acpi_data_node_fwnode) ?         \
                   ^
   include/acpi/acpi_bus.h:443:12: note: Access to field 'name' results in =
a dereference of a null pointer
                   (!strcmp(to_acpi_data_node(fwnode)->name, name)) : false;
                            ^
   include/acpi/acpi_bus.h:424:2: note: expanded from macro 'to_acpi_data_n=
ode'
           ({                                                              \
           ^
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/acpi/button.c:511:3: warning: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(name, ACPI_BUTTON_DEVICE_NAME_POWER);
                   ^~~~~~
   drivers/acpi/button.c:511:3: note: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119
                   strcpy(name, ACPI_BUTTON_DEVICE_NAME_POWER);
                   ^~~~~~
   drivers/acpi/button.c:517:3: warning: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(name, ACPI_BUTTON_DEVICE_NAME_SLEEP);
                   ^~~~~~
   drivers/acpi/button.c:517:3: note: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119
                   strcpy(name, ACPI_BUTTON_DEVICE_NAME_SLEEP);
                   ^~~~~~
   drivers/acpi/button.c:522:3: warning: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(name, ACPI_BUTTON_DEVICE_NAME_LID);
                   ^~~~~~
   drivers/acpi/button.c:522:3: note: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119
                   strcpy(name, ACPI_BUTTON_DEVICE_NAME_LID);
                   ^~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/gpu/drm/mga/mga_dma.c:267:15: warning: Assigned value is garbage=
 or undefined [clang-analyzer-core.uninitialized.Assign]
                   entry->next =3D dev_priv->head->next;
                               ^
   drivers/gpu/drm/mga/mga_dma.c:811:2: note: Assuming field 'sgram' is not=
 equal to 0
           if (init->sgram)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/gpu/drm/mga/mga_dma.c:811:2: note: '?' condition is false
           if (init->sgram)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/gpu/drm/mga/mga_dma.c:811:12: note: Field 'sgram' is not equal t=
o 0
           if (init->sgram)
                     ^
   drivers/gpu/drm/mga/mga_dma.c:811:2: note: '?' condition is true
           if (init->sgram)
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
   drivers/gpu/drm/mga/mga_dma.c:811:2: note: Taking true branch
           if (init->sgram)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/gpu/drm/mga/mga_dma.c:833:6: note: Assuming field 'sarea' is non=
-null
           if (!dev_priv->sarea) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/gpu/drm/mga/mga_dma.c:833:2: note: '?' condition is false
           if (!dev_priv->sarea) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/gpu/drm/mga/mga_dma.c:833:17: note: Field 'sarea' is non-null
           if (!dev_priv->sarea) {
                          ^
   drivers/gpu/drm/mga/mga_dma.c:833:2: note: '?' condition is false
           if (!dev_priv->sarea) {
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
   drivers/gpu/drm/mga/mga_dma.c:833:2: note: Taking false branch
           if (!dev_priv->sarea) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/gpu/drm/mga/mga_dma.c:838:6: note: Assuming field 'used_new_dma_=
init' is not equal to 0
           if (!dev_priv->used_new_dma_init) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/gpu/drm/mga/mga_dma.c:838:2: note: '?' condition is false
           if (!dev_priv->used_new_dma_init) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/gpu/drm/mga/mga_dma.c:838:17: note: Field 'used_new_dma_init' is=
 not equal to 0
           if (!dev_priv->used_new_dma_init) {
--
                                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/ipv6/mcast.c:1489:10: note: 'mark' is 0
                                   if (!mark)
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
   net/ipv6/mcast.c:1489:5: note: '?' condition is true
                                   if (!mark)
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
   net/ipv6/mcast.c:1489:5: note: Taking true branch
                                   if (!mark)
                                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/ipv6/mcast.c:1498:8: note: Assuming the condition is false
                           if (!(ma->mca_flags & MAF_GSQUERY) ||
                               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/ipv6/mcast.c:1498:8: note: Left side of '||' is false
                           if (!(ma->mca_flags & MAF_GSQUERY) ||
                               ^
   net/ipv6/mcast.c:1499:28: note: Access to field 'mld2q_nsrcs' results in=
 a dereference of a null pointer (loaded from variable 'mlh2')
                               mld_marksources(ma, ntohs(mlh2->mld2q_nsrcs)=
, mlh2->mld2q_srcs))
                                                   ^
   include/linux/byteorder/generic.h:142:18: note: expanded from macro 'nto=
hs'
   #define ntohs(x) ___ntohs(x)
                    ^        ~
   include/linux/byteorder/generic.h:137:21: note: expanded from macro '___=
ntohs'
   #define ___ntohs(x) __be16_to_cpu(x)
                       ^             ~
   include/uapi/linux/byteorder/little_endian.h:42:58: note: expanded from =
macro '__be16_to_cpu'
   #define __be16_to_cpu(x) __swab16((__force __u16)(__be16)(x))
                                                            ^~
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   fs/cifs/smb2misc.c:505:2: warning: Value stored to 'rc' is never read [c=
lang-analyzer-deadcode.DeadStores]
           rc =3D SMB2_lease_break(0, tlink_tcon(lw->tlink), lw->lease_key,
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/smb2misc.c:505:2: note: Value stored to 'rc' is never read
           rc =3D SMB2_lease_break(0, tlink_tcon(lw->tlink), lw->lease_key,
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   fs/cifs/smb2pdu.c:577:3: warning: Value stored to 'pneg_ctxt' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   pneg_ctxt +=3D ctxt_len;
                   ^            ~~~~~~~~
   fs/cifs/smb2pdu.c:577:3: note: Value stored to 'pneg_ctxt' is never read
                   pneg_ctxt +=3D ctxt_len;
                   ^            ~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
>> fs/cifs/cifsacl.c:267:21: warning: Assigned value is garbage or undefine=
d [clang-analyzer-core.uninitialized.Assign]
                   dst->authority[i] =3D src->authority[i];
                                     ^
   fs/cifs/cifsacl.c:1261:2: note: Assuming 'dacloffset' is not equal to 0
           if (dacloffset) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/cifs/cifsacl.c:1261:2: note: '?' condition is false
           if (dacloffset) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/cifs/cifsacl.c:1261:6: note: 'dacloffset' is not equal to 0
           if (dacloffset) {
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
   fs/cifs/cifsacl.c:1261:2: note: '?' condition is true
           if (dacloffset) {
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
   fs/cifs/cifsacl.c:1261:2: note: Taking true branch
           if (dacloffset) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/cifs/cifsacl.c:1263:3: note: '?' condition is false
                   if (end_of_acl < (char *)dacl_ptr + le16_to_cpu(dacl_ptr=
->size)) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/cifs/cifsacl.c:1263:3: note: Assuming the condition is false
                   if (end_of_acl < (char *)dacl_ptr + le16_to_cpu(dacl_ptr=
->size)) {
                   ^
   include/linux/compiler.h:56:44: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ~~~~=
~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/cifs/cifsacl.c:1263:3: note: '?' condition is false
                   if (end_of_acl < (char *)dacl_ptr + le16_to_cpu(dacl_ptr=
->size)) {
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
   fs/cifs/cifsacl.c:1263:3: note: Taking false branch
                   if (end_of_acl < (char *)dacl_ptr + le16_to_cpu(dacl_ptr=
->size)) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/cifs/cifsacl.c:1274:6: note: Assuming 'pnmode' is null
           if (pnmode && *pnmode !=3D NO_CHANGE_64) { /* chmod */
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/cifs/cifsacl.c:1274:13: note: Left side of '&&' is false
           if (pnmode && *pnmode !=3D NO_CHANGE_64) { /* chmod */

vim +267 drivers/gpu/drm/mga/mga_dma.c

^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  243=
  =

eddca551a3e7be drivers/char/drm/mga_dma.c    Dave Airlie    2007-07-11  244=
  static int mga_freelist_init(struct drm_device *dev, drm_mga_private_t *d=
ev_priv)
^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  245=
  {
cdd55a294c13f8 drivers/char/drm/mga_dma.c    Dave Airlie    2007-07-11  246=
  	struct drm_device_dma *dma =3D dev->dma;
056219e2fa6664 drivers/char/drm/mga_dma.c    Dave Airlie    2007-07-11  247=
  	struct drm_buf *buf;
^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  248=
  	drm_mga_buf_priv_t *buf_priv;
^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  249=
  	drm_mga_freelist_t *entry;
^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  250=
  	int i;
^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  251=
  	DRM_DEBUG("count=3D%d\n", dma->buf_count);
^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  252=
  =

9a298b2acd771d drivers/gpu/drm/mga/mga_dma.c Eric Anholt    2009-03-24  253=
  	dev_priv->head =3D kzalloc(sizeof(drm_mga_freelist_t), GFP_KERNEL);
^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  254=
  	if (dev_priv->head =3D=3D NULL)
20caafa6ecb248 drivers/char/drm/mga_dma.c    Eric Anholt    2007-08-25  255=
  		return -ENOMEM;
^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  256=
  =

^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  257=
  	SET_AGE(&dev_priv->head->age, MGA_BUFFER_USED, 0);
^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  258=
  =

^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  259=
  	for (i =3D 0; i < dma->buf_count; i++) {
^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  260=
  		buf =3D dma->buflist[i];
^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  261=
  		buf_priv =3D buf->dev_private;
^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  262=
  =

9a298b2acd771d drivers/gpu/drm/mga/mga_dma.c Eric Anholt    2009-03-24  263=
  		entry =3D kzalloc(sizeof(drm_mga_freelist_t), GFP_KERNEL);
^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  264=
  		if (entry =3D=3D NULL)
20caafa6ecb248 drivers/char/drm/mga_dma.c    Eric Anholt    2007-08-25  265=
  			return -ENOMEM;
^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  266=
  =

^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16 @267=
  		entry->next =3D dev_priv->head->next;
^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  268=
  		entry->prev =3D dev_priv->head;
^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  269=
  		SET_AGE(&entry->age, MGA_BUFFER_FREE, 0);
^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  270=
  		entry->buf =3D buf;
^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  271=
  =

^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  272=
  		if (dev_priv->head->next !=3D NULL)
^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  273=
  			dev_priv->head->next->prev =3D entry;
^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  274=
  		if (entry->next =3D=3D NULL)
^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  275=
  			dev_priv->tail =3D entry;
^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  276=
  =

^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  277=
  		buf_priv->list_entry =3D entry;
^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  278=
  		buf_priv->discard =3D 0;
^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  279=
  		buf_priv->dispatched =3D 0;
^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  280=
  =

^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  281=
  		dev_priv->head->next =3D entry;
^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  282=
  	}
^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  283=
  =

^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  284=
  	return 0;
^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  285=
  }
^1da177e4c3f41 drivers/char/drm/mga_dma.c    Linus Torvalds 2005-04-16  286=
  =


:::::: The code at line 267 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7922802706216931787==--

