Content-Type: multipart/mixed; boundary="===============7248965590721998783=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:dhowells/linux-fs/cifs-netfs 5/41] fs/cifs/smb2ops.c:4995:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Wed, 01 Jun 2022 10:08:57 +0800
Message-ID: <202206010953.pjbFFc6d-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7248965590721998783==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: fs/cifs/s=
mb2ops.c:4995:2: warning: Undefined or garbage value returned to caller [cl=
ang-analyzer-core.uninitialized.UndefReturn]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: David Howells <dhowells@redhat.com>

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/cifs-n=
etfs
head:   1fc71b6b30f6d2a981c163b77c9aee0aecaecb29
commit: 36c9de734b21b4bc60b7ee86228659d416d53470 [5/41] cifs: Change the I/=
O paths to use an iterator rather than a page list
:::::: branch date: 2 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20601/202206010953.pjbFFc6d-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0fbe3f=
3f486e01448121f7931a4ca29fac1504ab)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/36c9de734b21b4b=
c60b7ee86228659d416d53470
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/cifs-netfs
        git checkout 36c9de734b21b4bc60b7ee86228659d416d53470
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   fs/cifs/smb2ops.c:4652:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(iv, (char *)tr_hdr->Nonce, SMB3_AES_GCM_NONCE);
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
   fs/cifs/smb2ops.c:4655:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(iv + 1, (char *)tr_hdr->Nonce, SMB3_AES_CCM_NONCE=
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
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/cifs/smb2ops.c:4655:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(iv + 1, (char *)tr_hdr->Nonce, SMB3_AES_CCM_NONCE=
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
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/cifs/smb2ops.c:4668:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&tr_hdr->Signature, sign, SMB2_SIGNATURE_SIZE);
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
   fs/cifs/smb2ops.c:4668:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(&tr_hdr->Signature, sign, SMB2_SIGNATURE_SIZE);
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
   fs/cifs/smb2ops.c:4820:2: warning: Call to function 'memmove' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memmove_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(buf, iov[1].iov_base, buf_data_size);
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
   fs/cifs/smb2ops.c:4820:2: note: Call to function 'memmove' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memmove_s' in case of C11
           memmove(buf, iov[1].iov_base, buf_data_size);
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
>> fs/cifs/smb2ops.c:4995:2: warning: Undefined or garbage value returned t=
o caller [clang-analyzer-core.uninitialized.UndefReturn]
           return length;
           ^      ~~~~~~
   fs/cifs/smb2ops.c:4862:2: note: 'length' declared without an initial val=
ue
           int length;
           ^~~~~~~~~~
   fs/cifs/smb2ops.c:4865:6: note: Assuming field 'Command' is equal to SMB=
2_READ
           if (shdr->Command !=3D SMB2_READ) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/smb2ops.c:4865:2: note: Taking false branch
           if (shdr->Command !=3D SMB2_READ) {
           ^
   fs/cifs/smb2ops.c:4870:6: note: Assuming field 'is_session_expired' is n=
ull
           if (server->ops->is_session_expired &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/smb2ops.c:4870:38: note: Left side of '&&' is false
           if (server->ops->is_session_expired &&
                                               ^
   fs/cifs/smb2ops.c:4877:6: note: Assuming field 'is_status_pending' is nu=
ll
           if (server->ops->is_status_pending &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/smb2ops.c:4877:37: note: Left side of '&&' is false
           if (server->ops->is_status_pending &&
                                              ^
   fs/cifs/smb2ops.c:4886:3: note: Assuming '__UNIQUE_ID___x1317' is >=3D '=
__UNIQUE_ID___y1318'
                   min_t(unsigned int, buf_len, server->vals->read_rsp_size=
);
                   ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   fs/cifs/smb2ops.c:4886:3: note: '?' condition is false
                   min_t(unsigned int, buf_len, server->vals->read_rsp_size=
);
                   ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   fs/cifs/smb2ops.c:4887:2: note: Taking false branch
           cifs_dbg(FYI, "0: iov_base=3D%p iov_len=3D%zu\n",
           ^
   fs/cifs/cifs_debug.h:76:2: note: expanded from macro 'cifs_dbg'
           if ((type) & ONCE)                                              \
           ^
   fs/cifs/smb2ops.c:4887:2: note: Left side of '&&' is true
           cifs_dbg(FYI, "0: iov_base=3D%p iov_len=3D%zu\n",
           ^
   fs/cifs/cifs_debug.h:79:3: note: expanded from macro 'cifs_dbg'
                   cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__);   \
                   ^
   fs/cifs/cifs_debug.h:64:6: note: expanded from macro 'cifs_dbg_func'
           if ((type) & FYI && cifsFYI & CIFS_INFO) {                      \
               ^
   fs/cifs/smb2ops.c:4887:2: note: Assuming the condition is false
           cifs_dbg(FYI, "0: iov_base=3D%p iov_len=3D%zu\n",
           ^
   fs/cifs/cifs_debug.h:79:3: note: expanded from macro 'cifs_dbg'
                   cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__);   \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/cifs_debug.h:64:22: note: expanded from macro 'cifs_dbg_func'
           if ((type) & FYI && cifsFYI & CIFS_INFO) {                      \
                               ^~~~~~~~~~~~~~~~~~~
   fs/cifs/smb2ops.c:4887:2: note: Taking false branch
           cifs_dbg(FYI, "0: iov_base=3D%p iov_len=3D%zu\n",
           ^
   fs/cifs/cifs_debug.h:79:3: note: expanded from macro 'cifs_dbg'
                   cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__);   \
                   ^
   fs/cifs/cifs_debug.h:64:2: note: expanded from macro 'cifs_dbg_func'
           if ((type) & FYI && cifsFYI & CIFS_INFO) {                      \
           ^
   fs/cifs/smb2ops.c:4887:2: note: Taking false branch
           cifs_dbg(FYI, "0: iov_base=3D%p iov_len=3D%zu\n",
           ^
   fs/cifs/cifs_debug.h:79:3: note: expanded from macro 'cifs_dbg'
                   cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__);   \
                   ^
   fs/cifs/cifs_debug.h:67:9: note: expanded from macro 'cifs_dbg_func'
           } else if ((type) & VFS) {                                      \
                  ^
   fs/cifs/smb2ops.c:4887:2: note: Left side of '&&' is false
           cifs_dbg(FYI, "0: iov_base=3D%p iov_len=3D%zu\n",
           ^
   fs/cifs/cifs_debug.h:79:3: note: expanded from macro 'cifs_dbg'
                   cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__);   \

vim +4995 fs/cifs/smb2ops.c

c42a6abe301283 Pavel Shilovsky    2016-11-17  4849  =

4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4850  static int
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4851  handle_read_data(struct=
 TCP_Server_Info *server, struct mid_q_entry *mid,
36c9de734b21b4 David Howells      2022-01-24  4852  		 char *buf, unsigned =
int buf_len, struct xarray *pages,
36c9de734b21b4 David Howells      2022-01-24  4853  		 unsigned int pages_l=
en, bool is_offloaded)
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4854  {
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4855  	unsigned int data_offs=
et;
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4856  	unsigned int data_len;
c42a6abe301283 Pavel Shilovsky    2016-11-17  4857  	unsigned int cur_off;
c42a6abe301283 Pavel Shilovsky    2016-11-17  4858  	unsigned int cur_page_=
idx;
c42a6abe301283 Pavel Shilovsky    2016-11-17  4859  	unsigned int pad_len;
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4860  	struct cifs_readdata *=
rdata =3D mid->callback_data;
0d35e382e4e96a Ronnie Sahlberg    2021-11-05  4861  	struct smb2_hdr *shdr =
=3D (struct smb2_hdr *)buf;
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4862  	int length;
74dcf418fe3446 Long Li            2017-11-22  4863  	bool use_rdma_mr =3D f=
alse;
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4864  =

4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4865  	if (shdr->Command !=3D=
 SMB2_READ) {
3175eb9b577e82 Ronnie Sahlberg    2019-09-04  4866  		cifs_server_dbg(VFS, =
"only big read responses are supported\n");
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4867  		return -ENOTSUPP;
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4868  	}
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4869  =

511c54a2f69195 Pavel Shilovsky    2017-07-08  4870  	if (server->ops->is_se=
ssion_expired &&
511c54a2f69195 Pavel Shilovsky    2017-07-08  4871  	    server->ops->is_se=
ssion_expired(buf)) {
de9ac0a6e9efdf Rohith Surabattula 2020-10-28  4872  		if (!is_offloaded)
183eea2ee5ba96 Shyam Prasad N     2021-07-19  4873  			cifs_reconnect(serve=
r, true);
511c54a2f69195 Pavel Shilovsky    2017-07-08  4874  		return -1;
511c54a2f69195 Pavel Shilovsky    2017-07-08  4875  	}
511c54a2f69195 Pavel Shilovsky    2017-07-08  4876  =

4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4877  	if (server->ops->is_st=
atus_pending &&
66265f134acfb2 Pavel Shilovsky    2019-01-23  4878  			server->ops->is_stat=
us_pending(buf, server))
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4879  		return -1;
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4880  =

ec678eae746dd2 Pavel Shilovsky    2019-01-18  4881  	/* set up first two io=
v to get credits */
ec678eae746dd2 Pavel Shilovsky    2019-01-18  4882  	rdata->iov[0].iov_base=
 =3D buf;
bb1bccb60c2ebd Pavel Shilovsky    2019-01-17  4883  	rdata->iov[0].iov_len =
=3D 0;
bb1bccb60c2ebd Pavel Shilovsky    2019-01-17  4884  	rdata->iov[1].iov_base=
 =3D buf;
ec678eae746dd2 Pavel Shilovsky    2019-01-18  4885  	rdata->iov[1].iov_len =
=3D
bb1bccb60c2ebd Pavel Shilovsky    2019-01-17  4886  		min_t(unsigned int, b=
uf_len, server->vals->read_rsp_size);
ec678eae746dd2 Pavel Shilovsky    2019-01-18  4887  	cifs_dbg(FYI, "0: iov_=
base=3D%p iov_len=3D%zu\n",
ec678eae746dd2 Pavel Shilovsky    2019-01-18  4888  		 rdata->iov[0].iov_ba=
se, rdata->iov[0].iov_len);
ec678eae746dd2 Pavel Shilovsky    2019-01-18  4889  	cifs_dbg(FYI, "1: iov_=
base=3D%p iov_len=3D%zu\n",
ec678eae746dd2 Pavel Shilovsky    2019-01-18  4890  		 rdata->iov[1].iov_ba=
se, rdata->iov[1].iov_len);
ec678eae746dd2 Pavel Shilovsky    2019-01-18  4891  =

ec678eae746dd2 Pavel Shilovsky    2019-01-18  4892  	rdata->result =3D serv=
er->ops->map_error(buf, true);
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4893  	if (rdata->result !=3D=
 0) {
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4894  		cifs_dbg(FYI, "%s: se=
rver returned error %d\n",
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4895  			 __func__, rdata->re=
sult);
ec678eae746dd2 Pavel Shilovsky    2019-01-18  4896  		/* normal error on re=
ad response */
ac873aa3dc2170 Rohith Surabattula 2020-10-29  4897  		if (is_offloaded)
ac873aa3dc2170 Rohith Surabattula 2020-10-29  4898  			mid->mid_state =3D M=
ID_RESPONSE_RECEIVED;
ac873aa3dc2170 Rohith Surabattula 2020-10-29  4899  		else
ec678eae746dd2 Pavel Shilovsky    2019-01-18  4900  			dequeue_mid(mid, fal=
se);
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4901  		return 0;
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4902  	}
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4903  =

1fc6ad2f10ad6f Ronnie Sahlberg    2018-06-01  4904  	data_offset =3D server=
->ops->read_data_offset(buf);
74dcf418fe3446 Long Li            2017-11-22  4905  #ifdef CONFIG_CIFS_SMB_=
DIRECT
74dcf418fe3446 Long Li            2017-11-22  4906  	use_rdma_mr =3D rdata-=
>mr;
74dcf418fe3446 Long Li            2017-11-22  4907  #endif
74dcf418fe3446 Long Li            2017-11-22  4908  	data_len =3D server->o=
ps->read_data_length(buf, use_rdma_mr);
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4909  =

4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4910  	if (data_offset < serv=
er->vals->read_rsp_size) {
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4911  		/*
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4912  		 * win2k8 sometimes s=
ends an offset of 0 when the read
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4913  		 * is beyond the EOF.=
 Treat it as if the data starts just after
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4914  		 * the header.
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4915  		 */
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4916  		cifs_dbg(FYI, "%s: da=
ta offset (%u) inside read response header\n",
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4917  			 __func__, data_offs=
et);
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4918  		data_offset =3D serve=
r->vals->read_rsp_size;
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4919  	} else if (data_offset=
 > MAX_CIFS_SMALL_BUFFER_SIZE) {
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4920  		/* data_offset is bey=
ond the end of smallbuf */
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4921  		cifs_dbg(FYI, "%s: da=
ta offset (%u) beyond end of smallbuf\n",
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4922  			 __func__, data_offs=
et);
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4923  		rdata->result =3D -EI=
O;
ac873aa3dc2170 Rohith Surabattula 2020-10-29  4924  		if (is_offloaded)
ac873aa3dc2170 Rohith Surabattula 2020-10-29  4925  			mid->mid_state =3D M=
ID_RESPONSE_MALFORMED;
ac873aa3dc2170 Rohith Surabattula 2020-10-29  4926  		else
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4927  			dequeue_mid(mid, rda=
ta->result);
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4928  		return 0;
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4929  	}
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4930  =

c42a6abe301283 Pavel Shilovsky    2016-11-17  4931  	pad_len =3D data_offse=
t - server->vals->read_rsp_size;
c42a6abe301283 Pavel Shilovsky    2016-11-17  4932  =

4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4933  	if (buf_len <=3D data_=
offset) {
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4934  		/* read response payl=
oad is in pages */
c42a6abe301283 Pavel Shilovsky    2016-11-17  4935  		cur_page_idx =3D pad_=
len / PAGE_SIZE;
c42a6abe301283 Pavel Shilovsky    2016-11-17  4936  		cur_off =3D pad_len %=
 PAGE_SIZE;
c42a6abe301283 Pavel Shilovsky    2016-11-17  4937  =

c42a6abe301283 Pavel Shilovsky    2016-11-17  4938  		if (cur_page_idx !=3D=
 0) {
c42a6abe301283 Pavel Shilovsky    2016-11-17  4939  			/* data offset is be=
yond the 1st page of response */
c42a6abe301283 Pavel Shilovsky    2016-11-17  4940  			cifs_dbg(FYI, "%s: d=
ata offset (%u) beyond 1st page of response\n",
c42a6abe301283 Pavel Shilovsky    2016-11-17  4941  				 __func__, data_off=
set);
c42a6abe301283 Pavel Shilovsky    2016-11-17  4942  			rdata->result =3D -E=
IO;
ac873aa3dc2170 Rohith Surabattula 2020-10-29  4943  			if (is_offloaded)
ac873aa3dc2170 Rohith Surabattula 2020-10-29  4944  				mid->mid_state =3D =
MID_RESPONSE_MALFORMED;
ac873aa3dc2170 Rohith Surabattula 2020-10-29  4945  			else
c42a6abe301283 Pavel Shilovsky    2016-11-17  4946  				dequeue_mid(mid, rd=
ata->result);
c42a6abe301283 Pavel Shilovsky    2016-11-17  4947  			return 0;
c42a6abe301283 Pavel Shilovsky    2016-11-17  4948  		}
c42a6abe301283 Pavel Shilovsky    2016-11-17  4949  =

36c9de734b21b4 David Howells      2022-01-24  4950  		if (data_len > pages_=
len - pad_len) {
c42a6abe301283 Pavel Shilovsky    2016-11-17  4951  			/* data_len is corru=
pt -- discard frame */
c42a6abe301283 Pavel Shilovsky    2016-11-17  4952  			rdata->result =3D -E=
IO;
ac873aa3dc2170 Rohith Surabattula 2020-10-29  4953  			if (is_offloaded)
ac873aa3dc2170 Rohith Surabattula 2020-10-29  4954  				mid->mid_state =3D =
MID_RESPONSE_MALFORMED;
ac873aa3dc2170 Rohith Surabattula 2020-10-29  4955  			else
c42a6abe301283 Pavel Shilovsky    2016-11-17  4956  				dequeue_mid(mid, rd=
ata->result);
c42a6abe301283 Pavel Shilovsky    2016-11-17  4957  			return 0;
c42a6abe301283 Pavel Shilovsky    2016-11-17  4958  		}
c42a6abe301283 Pavel Shilovsky    2016-11-17  4959  =

36c9de734b21b4 David Howells      2022-01-24  4960  		/* Copy the data to t=
he output I/O iterator. */
36c9de734b21b4 David Howells      2022-01-24  4961  		rdata->result =3D cif=
s_copy_pages_to_iter(pages, pages_len,
36c9de734b21b4 David Howells      2022-01-24  4962  							cur_off, &rdata-=
>iter);
c42a6abe301283 Pavel Shilovsky    2016-11-17  4963  		if (rdata->result !=
=3D 0) {
ac873aa3dc2170 Rohith Surabattula 2020-10-29  4964  			if (is_offloaded)
ac873aa3dc2170 Rohith Surabattula 2020-10-29  4965  				mid->mid_state =3D =
MID_RESPONSE_MALFORMED;
ac873aa3dc2170 Rohith Surabattula 2020-10-29  4966  			else
c42a6abe301283 Pavel Shilovsky    2016-11-17  4967  				dequeue_mid(mid, rd=
ata->result);
c42a6abe301283 Pavel Shilovsky    2016-11-17  4968  			return 0;
c42a6abe301283 Pavel Shilovsky    2016-11-17  4969  		}
36c9de734b21b4 David Howells      2022-01-24  4970  		rdata->got_bytes =3D =
pages_len;
c42a6abe301283 Pavel Shilovsky    2016-11-17  4971  =

4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4972  	} else if (buf_len >=
=3D data_offset + data_len) {
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4973  		/* read response payl=
oad is in buf */
36c9de734b21b4 David Howells      2022-01-24  4974  		WARN_ONCE(pages && !x=
a_empty(pages),
36c9de734b21b4 David Howells      2022-01-24  4975  			  "read data can be =
either in buf or in pages");
36c9de734b21b4 David Howells      2022-01-24  4976  		length =3D copy_to_it=
er(buf + data_offset, data_len, &rdata->iter);
36c9de734b21b4 David Howells      2022-01-24  4977  		if (length < 0)
36c9de734b21b4 David Howells      2022-01-24  4978  			return length;
36c9de734b21b4 David Howells      2022-01-24  4979  		rdata->got_bytes =3D =
data_len;
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4980  	} else {
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4981  		/* read response payl=
oad cannot be in both buf and pages */
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4982  		WARN_ONCE(1, "buf can=
 not contain only a part of read data");
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4983  		rdata->result =3D -EI=
O;
ac873aa3dc2170 Rohith Surabattula 2020-10-29  4984  		if (is_offloaded)
ac873aa3dc2170 Rohith Surabattula 2020-10-29  4985  			mid->mid_state =3D M=
ID_RESPONSE_MALFORMED;
ac873aa3dc2170 Rohith Surabattula 2020-10-29  4986  		else
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4987  			dequeue_mid(mid, rda=
ta->result);
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4988  		return 0;
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4989  	}
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4990  =

ac873aa3dc2170 Rohith Surabattula 2020-10-29  4991  	if (is_offloaded)
ac873aa3dc2170 Rohith Surabattula 2020-10-29  4992  		mid->mid_state =3D MI=
D_RESPONSE_RECEIVED;
ac873aa3dc2170 Rohith Surabattula 2020-10-29  4993  	else
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4994  		dequeue_mid(mid, fals=
e);
4326ed2f6a16ae Pavel Shilovsky    2016-11-17 @4995  	return length;
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4996  }
4326ed2f6a16ae Pavel Shilovsky    2016-11-17  4997  =


:::::: The code at line 4995 was first introduced by commit
:::::: 4326ed2f6a16ae9d33e4209b540dc9a371aba840 CIFS: Decrypt and process s=
mall encrypted packets

:::::: TO: Pavel Shilovsky <pshilov@microsoft.com>
:::::: CC: Steve French <smfrench@gmail.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7248965590721998783==--

