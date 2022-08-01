Content-Type: multipart/mixed; boundary="===============4106276441775913577=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/cifs/smb2ops.c:598:3: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Tue, 02 Aug 2022 04:50:03 +0800
Message-ID: <202208020423.kITRVaqB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4106276441775913577==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: fs/cifs/s=
mb2ops.c:598:3: warning: Use of memory after it is freed [clang-analyzer-un=
ix.Malloc]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Shyam Prasad N <sprasad@microsoft.com>
CC: Steve French <stfrench@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0cec3f24a7cedc726f8790d693aaff2c535dc4ce
commit: aa45dadd34e44fcd6a9df4b395bee5b5633b4cec cifs: change iface_list fr=
om array to sorted linked list
date:   6 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 6 weeks ago
config: arm-randconfig-c002-20220731 (https://download.01.org/0day-ci/archi=
ve/20220802/202208020423.kITRVaqB-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00=
cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Daa45dadd34e44fcd6a9df4b395bee5b5633b4cec
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout aa45dadd34e44fcd6a9df4b395bee5b5633b4cec
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~
   drivers/md/dm-stats.c:1128:6: note: Call to function 'sscanf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sscanf_s' in case of C11
           if (sscanf(argv[1], "%d%c", &id, &dummy) !=3D 1 || id < 0)
               ^~~~~~
   drivers/md/dm-stats.c:1168:6: warning: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(argv[1], "%d%c", &id, &dummy) !=3D 1 || id < 0)
               ^~~~~~
   drivers/md/dm-stats.c:1168:6: note: Call to function 'sscanf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sscanf_s' in case of C11
           if (sscanf(argv[1], "%d%c", &id, &dummy) !=3D 1 || id < 0)
               ^~~~~~
   drivers/md/dm-stats.c:1173:7: warning: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                       sscanf(argv[2], "%lu%c", &idx_start, &dummy) !=3D 1)
                       ^~~~~~
   drivers/md/dm-stats.c:1173:7: note: Call to function 'sscanf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sscanf_s' in case of C11
                       sscanf(argv[2], "%lu%c", &idx_start, &dummy) !=3D 1)
                       ^~~~~~
   drivers/md/dm-stats.c:1176:7: warning: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                       sscanf(argv[3], "%lu%c", &idx_len, &dummy) !=3D 1)
                       ^~~~~~
   drivers/md/dm-stats.c:1176:7: note: Call to function 'sscanf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sscanf_s' in case of C11
                       sscanf(argv[3], "%lu%c", &idx_len, &dummy) !=3D 1)
                       ^~~~~~
   drivers/md/dm-stats.c:1193:6: warning: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(argv[1], "%d%c", &id, &dummy) !=3D 1 || id < 0)
               ^~~~~~
   drivers/md/dm-stats.c:1193:6: note: Call to function 'sscanf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sscanf_s' in case of C11
           if (sscanf(argv[1], "%d%c", &id, &dummy) !=3D 1 || id < 0)
               ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   drivers/crypto/ccree/cc_cipher.c:321:2: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&hki, key, keylen);
           ^~~~~~
   drivers/crypto/ccree/cc_cipher.c:321:2: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&hki, key, keylen);
           ^~~~~~
   drivers/crypto/ccree/cc_cipher.c:472:2: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ctx_p->user.key, key, keylen);
           ^~~~~~
   drivers/crypto/ccree/cc_cipher.c:472:2: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(ctx_p->user.key, key, keylen);
           ^~~~~~
   drivers/crypto/ccree/cc_cipher.c:870:3: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(req->iv, req_ctx->iv, ivsize);
                   ^~~~~~
   drivers/crypto/ccree/cc_cipher.c:870:3: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(req->iv, req_ctx->iv, ivsize);
                   ^~~~~~
   drivers/crypto/ccree/cc_cipher.c:994:2: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(req_ctx, 0, sizeof(*req_ctx));
           ^~~~~~
   drivers/crypto/ccree/cc_cipher.c:994:2: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
           memset(req_ctx, 0, sizeof(*req_ctx));
           ^~~~~~
   drivers/crypto/ccree/cc_cipher.c:1003:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(req_ctx, 0, sizeof(*req_ctx));
           ^~~~~~
   drivers/crypto/ccree/cc_cipher.c:1003:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(req_ctx, 0, sizeof(*req_ctx));
           ^~~~~~
   drivers/crypto/ccree/cc_cipher.c:1428:2: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(alg, &tmpl->template_skcipher, sizeof(*alg));
           ^~~~~~
   drivers/crypto/ccree/cc_cipher.c:1428:2: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(alg, &tmpl->template_skcipher, sizeof(*alg));
           ^~~~~~
   drivers/crypto/ccree/cc_cipher.c:1430:2: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(alg->base.cra_name, CRYPTO_MAX_ALG_NAME, "%s", tmpl->na=
me);
           ^~~~~~~~
   drivers/crypto/ccree/cc_cipher.c:1430:2: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(alg->base.cra_name, CRYPTO_MAX_ALG_NAME, "%s", tmpl->na=
me);
           ^~~~~~~~
   drivers/crypto/ccree/cc_cipher.c:1431:2: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(alg->base.cra_driver_name, CRYPTO_MAX_ALG_NAME, "%s",
           ^~~~~~~~
   drivers/crypto/ccree/cc_cipher.c:1431:2: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(alg->base.cra_driver_name, CRYPTO_MAX_ALG_NAME, "%s",
           ^~~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   129 warnings generated.
   fs/cifs/smb2ops.c:546:3: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&tmp_iface, 0, sizeof(tmp_iface));
                   ^~~~~~
   fs/cifs/smb2ops.c:546:3: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
                   memset(&tmp_iface, 0, sizeof(tmp_iface));
                   ^~~~~~
   fs/cifs/smb2ops.c:561:4: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&addr4->sin_addr, &p4->IPv4Address, 4);
                           ^~~~~~
   fs/cifs/smb2ops.c:561:4: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                           memcpy(&addr4->sin_addr, &p4->IPv4Address, 4);
                           ^~~~~~
   fs/cifs/smb2ops.c:573:4: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&addr6->sin6_addr, &p6->IPv6Address, 16);
                           ^~~~~~
   fs/cifs/smb2ops.c:573:4: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                           memcpy(&addr6->sin6_addr, &p6->IPv6Address, 16);
                           ^~~~~~
>> fs/cifs/smb2ops.c:598:3: warning: Use of memory after it is freed [clang=
-analyzer-unix.Malloc]
                   list_for_each_entry_safe(iface, niface, &ses->iface_list,
                   ^
   include/linux/list.h:762:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   fs/cifs/smb2ops.c:538:2: note: Loop condition is true.  Entering loop bo=
dy
           list_for_each_entry_safe(iface, niface, &ses->iface_list,
           ^
   include/linux/list.h:761:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   fs/cifs/smb2ops.c:541:3: note: Calling 'kref_put'
                   kref_put(&iface->refcount, release_iface);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'release_iface'
                   release(kref);
                   ^~~~~~~~~~~~~
   fs/cifs/cifsglob.h:953:2: note: Memory is released
           kfree(iface);
           ^~~~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   fs/cifs/smb2ops.c:541:3: note: Returning; memory was released
                   kref_put(&iface->refcount, release_iface);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/smb2ops.c:538:2: note: Loop condition is false. Execution contin=
ues on line 543
           list_for_each_entry_safe(iface, niface, &ses->iface_list,
           ^
   include/linux/list.h:761:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   fs/cifs/smb2ops.c:545:9: note: Assuming the condition is true
           while (bytes_left >=3D sizeof(*p)) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/smb2ops.c:545:2: note: Loop condition is true.  Entering loop bo=
dy
           while (bytes_left >=3D sizeof(*p)) {
           ^
   fs/cifs/smb2ops.c:548:28: note: Assuming the condition is false
                   tmp_iface.rdma_capable =3D le32_to_cpu(p->Capability & R=
DMA_CAPABLE) ? 1 : 0;
                                            ^
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32=
_to_cpu'
   #define le32_to_cpu __le32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:35:27: note: expanded from =
macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/smb2ops.c:548:28: note: '?' condition is false
                   tmp_iface.rdma_capable =3D le32_to_cpu(p->Capability & R=
DMA_CAPABLE) ? 1 : 0;
                                            ^
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32=
_to_cpu'
   #define le32_to_cpu __le32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:35:26: note: expanded from =
macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                            ^
   fs/cifs/smb2ops.c:549:27: note: Assuming the condition is true
                   tmp_iface.rss_capable =3D le32_to_cpu(p->Capability & RS=
S_CAPABLE) ? 1 : 0;
                                           ^
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32=
_to_cpu'
   #define le32_to_cpu __le32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:35:27: note: expanded from =
macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/smb2ops.c:549:27: note: '?' condition is true
                   tmp_iface.rss_capable =3D le32_to_cpu(p->Capability & RS=
S_CAPABLE) ? 1 : 0;
                                           ^
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32=
_to_cpu'
   #define le32_to_cpu __le32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:35:26: note: expanded from =
macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                            ^
   fs/cifs/smb2ops.c:551:3: note: Control jumps to 'case 2:'  at line 557
                   switch (p->Family) {
                   ^
   fs/cifs/smb2ops.c:566:4: note: Taking false branch
                           cifs_dbg(FYI, "%s: ipv4 %pI4\n", __func__,
                           ^
   fs/cifs/cifs_debug.h:76:2: note: expanded from macro 'cifs_dbg'
           if ((type) & ONCE)                                              \
           ^
   fs/cifs/smb2ops.c:566:4: note: Left side of '&&' is true
                           cifs_dbg(FYI, "%s: ipv4 %pI4\n", __func__,
                           ^
   fs/cifs/cifs_debug.h:79:3: note: expanded from macro 'cifs_dbg'
                   cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__);   \

vim +598 fs/cifs/smb2ops.c

fe856be475f7cf Aurelien Aptel 2018-06-14  511  =

fe856be475f7cf Aurelien Aptel 2018-06-14  512  static int
fe856be475f7cf Aurelien Aptel 2018-06-14  513  parse_server_interfaces(stru=
ct network_interface_info_ioctl_rsp *buf,
fe856be475f7cf Aurelien Aptel 2018-06-14  514  			size_t buf_len,
aa45dadd34e44f Shyam Prasad N 2022-01-01  515  			struct cifs_ses *ses)
fe856be475f7cf Aurelien Aptel 2018-06-14  516  {
fe856be475f7cf Aurelien Aptel 2018-06-14  517  	struct network_interface_in=
fo_ioctl_rsp *p;
fe856be475f7cf Aurelien Aptel 2018-06-14  518  	struct sockaddr_in *addr4;
fe856be475f7cf Aurelien Aptel 2018-06-14  519  	struct sockaddr_in6 *addr6;
fe856be475f7cf Aurelien Aptel 2018-06-14  520  	struct iface_info_ipv4 *p4;
fe856be475f7cf Aurelien Aptel 2018-06-14  521  	struct iface_info_ipv6 *p6;
aa45dadd34e44f Shyam Prasad N 2022-01-01  522  	struct cifs_server_iface *i=
nfo =3D NULL, *iface =3D NULL, *niface =3D NULL;
aa45dadd34e44f Shyam Prasad N 2022-01-01  523  	struct cifs_server_iface tm=
p_iface;
fe856be475f7cf Aurelien Aptel 2018-06-14  524  	ssize_t bytes_left;
fe856be475f7cf Aurelien Aptel 2018-06-14  525  	size_t next =3D 0;
fe856be475f7cf Aurelien Aptel 2018-06-14  526  	int nb_iface =3D 0;
aa45dadd34e44f Shyam Prasad N 2022-01-01  527  	int rc =3D 0, ret =3D 0;
fe856be475f7cf Aurelien Aptel 2018-06-14  528  =

fe856be475f7cf Aurelien Aptel 2018-06-14  529  	bytes_left =3D buf_len;
fe856be475f7cf Aurelien Aptel 2018-06-14  530  	p =3D buf;
fe856be475f7cf Aurelien Aptel 2018-06-14  531  =

aa45dadd34e44f Shyam Prasad N 2022-01-01  532  	spin_lock(&ses->iface_lock);
fe856be475f7cf Aurelien Aptel 2018-06-14  533  	/*
aa45dadd34e44f Shyam Prasad N 2022-01-01  534  	 * Go through iface_list an=
d do kref_put to remove
aa45dadd34e44f Shyam Prasad N 2022-01-01  535  	 * any unused ifaces. iface=
s in use will be removed
aa45dadd34e44f Shyam Prasad N 2022-01-01  536  	 * when the last user calls=
 a kref_put on it
fe856be475f7cf Aurelien Aptel 2018-06-14  537  	 */
aa45dadd34e44f Shyam Prasad N 2022-01-01  538  	list_for_each_entry_safe(if=
ace, niface, &ses->iface_list,
aa45dadd34e44f Shyam Prasad N 2022-01-01  539  				 iface_head) {
aa45dadd34e44f Shyam Prasad N 2022-01-01  540  		iface->is_active =3D 0;
aa45dadd34e44f Shyam Prasad N 2022-01-01  541  		kref_put(&iface->refcount,=
 release_iface);
fe856be475f7cf Aurelien Aptel 2018-06-14  542  	}
aa45dadd34e44f Shyam Prasad N 2022-01-01  543  	spin_unlock(&ses->iface_loc=
k);
fe856be475f7cf Aurelien Aptel 2018-06-14  544  =

fe856be475f7cf Aurelien Aptel 2018-06-14  545  	while (bytes_left >=3D size=
of(*p)) {
aa45dadd34e44f Shyam Prasad N 2022-01-01  546  		memset(&tmp_iface, 0, size=
of(tmp_iface));
aa45dadd34e44f Shyam Prasad N 2022-01-01  547  		tmp_iface.speed =3D le64_t=
o_cpu(p->LinkSpeed);
aa45dadd34e44f Shyam Prasad N 2022-01-01  548  		tmp_iface.rdma_capable =3D=
 le32_to_cpu(p->Capability & RDMA_CAPABLE) ? 1 : 0;
aa45dadd34e44f Shyam Prasad N 2022-01-01  549  		tmp_iface.rss_capable =3D =
le32_to_cpu(p->Capability & RSS_CAPABLE) ? 1 : 0;
fe856be475f7cf Aurelien Aptel 2018-06-14  550  =

fe856be475f7cf Aurelien Aptel 2018-06-14  551  		switch (p->Family) {
fe856be475f7cf Aurelien Aptel 2018-06-14  552  		/*
fe856be475f7cf Aurelien Aptel 2018-06-14  553  		 * The kernel and wire soc=
ket structures have the same
fe856be475f7cf Aurelien Aptel 2018-06-14  554  		 * layout and use network =
byte order but make the
fe856be475f7cf Aurelien Aptel 2018-06-14  555  		 * conversion explicit in =
case either one changes.
fe856be475f7cf Aurelien Aptel 2018-06-14  556  		 */
fe856be475f7cf Aurelien Aptel 2018-06-14  557  		case INTERNETWORK:
aa45dadd34e44f Shyam Prasad N 2022-01-01  558  			addr4 =3D (struct sockadd=
r_in *)&tmp_iface.sockaddr;
fe856be475f7cf Aurelien Aptel 2018-06-14  559  			p4 =3D (struct iface_info=
_ipv4 *)p->Buffer;
fe856be475f7cf Aurelien Aptel 2018-06-14  560  			addr4->sin_family =3D AF_=
INET;
fe856be475f7cf Aurelien Aptel 2018-06-14  561  			memcpy(&addr4->sin_addr, =
&p4->IPv4Address, 4);
fe856be475f7cf Aurelien Aptel 2018-06-14  562  =

fe856be475f7cf Aurelien Aptel 2018-06-14  563  			/* [MS-SMB2] 2.2.32.5.1.1=
 Clients MUST ignore these */
fe856be475f7cf Aurelien Aptel 2018-06-14  564  			addr4->sin_port =3D cpu_t=
o_be16(CIFS_PORT);
fe856be475f7cf Aurelien Aptel 2018-06-14  565  =

fe856be475f7cf Aurelien Aptel 2018-06-14  566  			cifs_dbg(FYI, "%s: ipv4 %=
pI4\n", __func__,
fe856be475f7cf Aurelien Aptel 2018-06-14  567  				 &addr4->sin_addr);
fe856be475f7cf Aurelien Aptel 2018-06-14  568  			break;
fe856be475f7cf Aurelien Aptel 2018-06-14  569  		case INTERNETWORKV6:
aa45dadd34e44f Shyam Prasad N 2022-01-01  570  			addr6 =3D	(struct sockadd=
r_in6 *)&tmp_iface.sockaddr;
fe856be475f7cf Aurelien Aptel 2018-06-14  571  			p6 =3D (struct iface_info=
_ipv6 *)p->Buffer;
fe856be475f7cf Aurelien Aptel 2018-06-14  572  			addr6->sin6_family =3D AF=
_INET6;
fe856be475f7cf Aurelien Aptel 2018-06-14  573  			memcpy(&addr6->sin6_addr,=
 &p6->IPv6Address, 16);
fe856be475f7cf Aurelien Aptel 2018-06-14  574  =

fe856be475f7cf Aurelien Aptel 2018-06-14  575  			/* [MS-SMB2] 2.2.32.5.1.2=
 Clients MUST ignore these */
fe856be475f7cf Aurelien Aptel 2018-06-14  576  			addr6->sin6_flowinfo =3D =
0;
fe856be475f7cf Aurelien Aptel 2018-06-14  577  			addr6->sin6_scope_id =3D =
0;
fe856be475f7cf Aurelien Aptel 2018-06-14  578  			addr6->sin6_port =3D cpu_=
to_be16(CIFS_PORT);
fe856be475f7cf Aurelien Aptel 2018-06-14  579  =

fe856be475f7cf Aurelien Aptel 2018-06-14  580  			cifs_dbg(FYI, "%s: ipv6 %=
pI6\n", __func__,
fe856be475f7cf Aurelien Aptel 2018-06-14  581  				 &addr6->sin6_addr);
fe856be475f7cf Aurelien Aptel 2018-06-14  582  			break;
fe856be475f7cf Aurelien Aptel 2018-06-14  583  		default:
fe856be475f7cf Aurelien Aptel 2018-06-14  584  			cifs_dbg(VFS,
fe856be475f7cf Aurelien Aptel 2018-06-14  585  				 "%s: skipping unsupport=
ed socket family\n",
fe856be475f7cf Aurelien Aptel 2018-06-14  586  				 __func__);
fe856be475f7cf Aurelien Aptel 2018-06-14  587  			goto next_iface;
fe856be475f7cf Aurelien Aptel 2018-06-14  588  		}
fe856be475f7cf Aurelien Aptel 2018-06-14  589  =

aa45dadd34e44f Shyam Prasad N 2022-01-01  590  		/*
aa45dadd34e44f Shyam Prasad N 2022-01-01  591  		 * The iface_list is assum=
ed to be sorted by speed.
aa45dadd34e44f Shyam Prasad N 2022-01-01  592  		 * Check if the new interf=
ace exists in that list.
aa45dadd34e44f Shyam Prasad N 2022-01-01  593  		 * NEVER change iface. it =
could be in use.
aa45dadd34e44f Shyam Prasad N 2022-01-01  594  		 * Add a new one instead
aa45dadd34e44f Shyam Prasad N 2022-01-01  595  		 */
aa45dadd34e44f Shyam Prasad N 2022-01-01  596  		spin_lock(&ses->iface_lock=
);
aa45dadd34e44f Shyam Prasad N 2022-01-01  597  		iface =3D niface =3D NULL;
aa45dadd34e44f Shyam Prasad N 2022-01-01 @598  		list_for_each_entry_safe(i=
face, niface, &ses->iface_list,
aa45dadd34e44f Shyam Prasad N 2022-01-01  599  					 iface_head) {
aa45dadd34e44f Shyam Prasad N 2022-01-01  600  			ret =3D iface_cmp(iface, =
&tmp_iface);
aa45dadd34e44f Shyam Prasad N 2022-01-01  601  			if (!ret) {
aa45dadd34e44f Shyam Prasad N 2022-01-01  602  				/* just get a ref so tha=
t it doesn't get picked/freed */
aa45dadd34e44f Shyam Prasad N 2022-01-01  603  				iface->is_active =3D 1;
aa45dadd34e44f Shyam Prasad N 2022-01-01  604  				kref_get(&iface->refcoun=
t);
aa45dadd34e44f Shyam Prasad N 2022-01-01  605  				spin_unlock(&ses->iface_=
lock);
aa45dadd34e44f Shyam Prasad N 2022-01-01  606  				goto next_iface;
aa45dadd34e44f Shyam Prasad N 2022-01-01  607  			} else if (ret < 0) {
aa45dadd34e44f Shyam Prasad N 2022-01-01  608  				/* all remaining ifaces =
are slower */
aa45dadd34e44f Shyam Prasad N 2022-01-01  609  				kref_get(&iface->refcoun=
t);
aa45dadd34e44f Shyam Prasad N 2022-01-01  610  				break;
aa45dadd34e44f Shyam Prasad N 2022-01-01  611  			}
aa45dadd34e44f Shyam Prasad N 2022-01-01  612  		}
aa45dadd34e44f Shyam Prasad N 2022-01-01  613  		spin_unlock(&ses->iface_lo=
ck);
aa45dadd34e44f Shyam Prasad N 2022-01-01  614  =

aa45dadd34e44f Shyam Prasad N 2022-01-01  615  		/* no match. insert the en=
try in the list */
aa45dadd34e44f Shyam Prasad N 2022-01-01  616  		info =3D kmalloc(sizeof(st=
ruct cifs_server_iface),
aa45dadd34e44f Shyam Prasad N 2022-01-01  617  			       GFP_KERNEL);
aa45dadd34e44f Shyam Prasad N 2022-01-01  618  		if (!info) {
aa45dadd34e44f Shyam Prasad N 2022-01-01  619  			rc =3D -ENOMEM;
aa45dadd34e44f Shyam Prasad N 2022-01-01  620  			goto out;
aa45dadd34e44f Shyam Prasad N 2022-01-01  621  		}
aa45dadd34e44f Shyam Prasad N 2022-01-01  622  		memcpy(info, &tmp_iface, s=
izeof(tmp_iface));
aa45dadd34e44f Shyam Prasad N 2022-01-01  623  =

aa45dadd34e44f Shyam Prasad N 2022-01-01  624  		/* add this new entry to t=
he list */
aa45dadd34e44f Shyam Prasad N 2022-01-01  625  		kref_init(&info->refcount);
aa45dadd34e44f Shyam Prasad N 2022-01-01  626  		info->is_active =3D 1;
aa45dadd34e44f Shyam Prasad N 2022-01-01  627  =

aa45dadd34e44f Shyam Prasad N 2022-01-01  628  		cifs_dbg(FYI, "%s: adding =
iface %zu\n", __func__, ses->iface_count);
aa45dadd34e44f Shyam Prasad N 2022-01-01  629  		cifs_dbg(FYI, "%s: speed %=
zu bps\n", __func__, info->speed);
aa45dadd34e44f Shyam Prasad N 2022-01-01  630  		cifs_dbg(FYI, "%s: capabil=
ities 0x%08x\n", __func__,
aa45dadd34e44f Shyam Prasad N 2022-01-01  631  			 le32_to_cpu(p->Capabilit=
y));
aa45dadd34e44f Shyam Prasad N 2022-01-01  632  =

aa45dadd34e44f Shyam Prasad N 2022-01-01  633  		spin_lock(&ses->iface_lock=
);
aa45dadd34e44f Shyam Prasad N 2022-01-01  634  		if (!list_entry_is_head(if=
ace, &ses->iface_list, iface_head)) {
aa45dadd34e44f Shyam Prasad N 2022-01-01  635  			list_add_tail(&info->ifac=
e_head, &iface->iface_head);
aa45dadd34e44f Shyam Prasad N 2022-01-01  636  			kref_put(&iface->refcount=
, release_iface);
aa45dadd34e44f Shyam Prasad N 2022-01-01  637  		} else
aa45dadd34e44f Shyam Prasad N 2022-01-01  638  			list_add_tail(&info->ifac=
e_head, &ses->iface_list);
aa45dadd34e44f Shyam Prasad N 2022-01-01  639  		spin_unlock(&ses->iface_lo=
ck);
aa45dadd34e44f Shyam Prasad N 2022-01-01  640  =

aa45dadd34e44f Shyam Prasad N 2022-01-01  641  		ses->iface_count++;
aa45dadd34e44f Shyam Prasad N 2022-01-01  642  		ses->iface_last_update =3D=
 jiffies;
fe856be475f7cf Aurelien Aptel 2018-06-14  643  next_iface:
aa45dadd34e44f Shyam Prasad N 2022-01-01  644  		nb_iface++;
fe856be475f7cf Aurelien Aptel 2018-06-14  645  		next =3D le32_to_cpu(p->Ne=
xt);
aa45dadd34e44f Shyam Prasad N 2022-01-01  646  		if (!next) {
aa45dadd34e44f Shyam Prasad N 2022-01-01  647  			bytes_left -=3D sizeof(*p=
);
fe856be475f7cf Aurelien Aptel 2018-06-14  648  			break;
aa45dadd34e44f Shyam Prasad N 2022-01-01  649  		}
fe856be475f7cf Aurelien Aptel 2018-06-14  650  		p =3D (struct network_inte=
rface_info_ioctl_rsp *)((u8 *)p+next);
fe856be475f7cf Aurelien Aptel 2018-06-14  651  		bytes_left -=3D next;
fe856be475f7cf Aurelien Aptel 2018-06-14  652  	}
fe856be475f7cf Aurelien Aptel 2018-06-14  653  =

aa45dadd34e44f Shyam Prasad N 2022-01-01  654  	if (!nb_iface) {
aa45dadd34e44f Shyam Prasad N 2022-01-01  655  		cifs_dbg(VFS, "%s: malform=
ed interface info\n", __func__);
fe856be475f7cf Aurelien Aptel 2018-06-14  656  		rc =3D -EINVAL;
fe856be475f7cf Aurelien Aptel 2018-06-14  657  		goto out;
fe856be475f7cf Aurelien Aptel 2018-06-14  658  	}
fe856be475f7cf Aurelien Aptel 2018-06-14  659  =

aa45dadd34e44f Shyam Prasad N 2022-01-01  660  	/* Azure rounds the buffer =
size up 8, to a 16 byte boundary */
aa45dadd34e44f Shyam Prasad N 2022-01-01  661  	if ((bytes_left > 8) || p->=
Next)
aa45dadd34e44f Shyam Prasad N 2022-01-01  662  		cifs_dbg(VFS, "%s: incompl=
ete interface info\n", __func__);
fe856be475f7cf Aurelien Aptel 2018-06-14  663  =

35adffed079fdc Aurelien Aptel 2019-09-20  664  =

aa45dadd34e44f Shyam Prasad N 2022-01-01  665  	if (!ses->iface_count) {
aa45dadd34e44f Shyam Prasad N 2022-01-01  666  		rc =3D -EINVAL;
aa45dadd34e44f Shyam Prasad N 2022-01-01  667  		goto out;
aa45dadd34e44f Shyam Prasad N 2022-01-01  668  	}
aa45dadd34e44f Shyam Prasad N 2022-01-01  669  =

aa45dadd34e44f Shyam Prasad N 2022-01-01  670  out:
aa45dadd34e44f Shyam Prasad N 2022-01-01  671  	return rc;
35adffed079fdc Aurelien Aptel 2019-09-20  672  }
fe856be475f7cf Aurelien Aptel 2018-06-14  673  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4106276441775913577==--

