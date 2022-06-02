Content-Type: multipart/mixed; boundary="===============3831631177412853266=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 3/3] btrfs: Replace kmap() with kmap_local_page() in zlib.c
Date: Thu, 02 Jun 2022 09:53:30 +0800
Message-ID: <202206020905.Tu4jT2D3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3831631177412853266==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: fs/btrfs/=
zlib.c:151:10: warning: Branch condition evaluates to a garbage value [clan=
g-analyzer-core.uninitialized.Branch]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220531145335.13954-4-fmdefrancesco@gmail.com>
References: <20220531145335.13954-4-fmdefrancesco@gmail.com>
TO: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
TO: Chris Mason <chris.mason@fusionio.com>
TO: Josef Bacik <josef@toxicpanda.com>
TO: David Sterba <dsterba@suse.com>
TO: Ira Weiny <ira.weiny@intel.com>
TO: linux-btrfs(a)vger.kernel.org
TO: linux-kernel(a)vger.kernel.org
CC: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>

Hi "Fabio,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on kdave/for-next]
[also build test WARNING on v5.18 next-20220601]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Fabio-M-De-Francesco=
/btrfs-Replace-kmap-with-kmap_local_page/20220531-225557
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for=
-next
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: mips-randconfig-c004-20220531 (https://download.01.org/0day-ci/arch=
ive/20220602/202206020905.Tu4jT2D3-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825ab=
d6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/a549d3a90067e82e5e7=
d44d78a98e4a4feb628c3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Fabio-M-De-Francesco/btrfs-Replace=
-kmap-with-kmap_local_page/20220531-225557
        git checkout a549d3a90067e82e5e7d44d78a98e4a4feb628c3
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~
   drivers/md/dm-crypt.c:2619:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(key, '0', key_string_len);
           ^~~~~~
   drivers/md/dm-crypt.c:2641:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&cc->key, 0, cc->key_size * sizeof(u8));
           ^~~~~~
   drivers/md/dm-crypt.c:2641:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(&cc->key, 0, cc->key_size * sizeof(u8));
           ^~~~~~
   drivers/md/dm-crypt.c:2832:2: warning: Call to function 'strncpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(mac_alg, start, end - start);
           ^~~~~~~
   drivers/md/dm-crypt.c:2832:2: note: Call to function 'strncpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'strncpy_s' in case of C11
           strncpy(mac_alg, start, end - start);
           ^~~~~~~
   drivers/md/dm-crypt.c:2897:9: warning: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D snprintf(buf, CRYPTO_MAX_ALG_NAME, "essiv(%s,%s)=
",
                         ^~~~~~~~
   drivers/md/dm-crypt.c:2897:9: note: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11
                   ret =3D snprintf(buf, CRYPTO_MAX_ALG_NAME, "essiv(%s,%s)=
",
                         ^~~~~~~~
   drivers/md/dm-crypt.c:2947:11: warning: Call to function 'sscanf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           else if (sscanf(keycount, "%u%c", &cc->tfms_count, &dummy) !=3D =
1 ||
                    ^~~~~~
   drivers/md/dm-crypt.c:2947:11: note: Call to function 'sscanf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sscanf_s' in case of C11
           else if (sscanf(keycount, "%u%c", &cc->tfms_count, &dummy) !=3D =
1 ||
                    ^~~~~~
   drivers/md/dm-crypt.c:2982:9: warning: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D snprintf(cipher_api, CRYPTO_MAX_ALG_NAME,
                         ^~~~~~~~
   drivers/md/dm-crypt.c:2982:9: note: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11
                   ret =3D snprintf(cipher_api, CRYPTO_MAX_ALG_NAME,
                         ^~~~~~~~
   drivers/md/dm-crypt.c:2985:9: warning: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D snprintf(cipher_api, CRYPTO_MAX_ALG_NAME,
                         ^~~~~~~~
   drivers/md/dm-crypt.c:2985:9: note: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11
                   ret =3D snprintf(cipher_api, CRYPTO_MAX_ALG_NAME,
                         ^~~~~~~~
   drivers/md/dm-crypt.c:3059:3: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(cc->key, 0, cc->key_size * sizeof(u8));
                   ^~~~~~
   drivers/md/dm-crypt.c:3059:3: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
                   memset(cc->key, 0, cc->key_size * sizeof(u8));
                   ^~~~~~
   drivers/md/dm-crypt.c:3103:12: warning: Call to function 'sscanf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   else if (sscanf(opt_string, "integrity:%u:", &val) =3D=
=3D 1) {
                            ^~~~~~
   drivers/md/dm-crypt.c:3103:12: note: Call to function 'sscanf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sscanf_s' in case of C11
                   else if (sscanf(opt_string, "integrity:%u:", &val) =3D=
=3D 1) {
                            ^~~~~~
   drivers/md/dm-crypt.c:3120:14: warning: Call to function 'sscanf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   } else if (sscanf(opt_string, "sector_size:%hu%c", &cc->=
sector_size, &dummy) =3D=3D 1) {
                              ^~~~~~
   drivers/md/dm-crypt.c:3120:14: note: Call to function 'sscanf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sscanf_s' in case of C11
                   } else if (sscanf(opt_string, "sector_size:%hu%c", &cc->=
sector_size, &dummy) =3D=3D 1) {
                              ^~~~~~
   drivers/md/dm-crypt.c:3270:7: warning: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if ((sscanf(argv[2], "%llu%c", &tmpll, &dummy) !=3D 1) ||
                ^~~~~~
   drivers/md/dm-crypt.c:3270:7: note: Call to function 'sscanf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sscanf_s' in case of C11
           if ((sscanf(argv[2], "%llu%c", &tmpll, &dummy) !=3D 1) ||
                ^~~~~~
   drivers/md/dm-crypt.c:3284:6: warning: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(argv[4], "%llu%c", &tmpll, &dummy) !=3D 1 || tmpll !=
=3D (sector_t)tmpll) {
               ^~~~~~
   drivers/md/dm-crypt.c:3284:6: note: Call to function 'sscanf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sscanf_s' in case of C11
           if (sscanf(argv[4], "%llu%c", &tmpll, &dummy) !=3D 1 || tmpll !=
=3D (sector_t)tmpll) {
               ^~~~~~
   drivers/md/dm-crypt.c:3577:5: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(argv[2], '0', strlen(argv[2]));
                                   ^~~~~~
   drivers/md/dm-crypt.c:3577:5: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
                                   memset(argv[2], '0', strlen(argv[2]));
                                   ^~~~~~
   drivers/md/dm-crypt.c:3588:5: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(cc->key, 0, cc->key_size * sizeof=
(u8));
                                   ^~~~~~
   drivers/md/dm-crypt.c:3588:5: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
                                   memset(cc->key, 0, cc->key_size * sizeof=
(u8));
                                   ^~~~~~
   Suppressed 60 warnings (60 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   fs/btrfs/free-space-cache.c:385:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(io_ctl, 0, sizeof(struct btrfs_io_ctl));
           ^~~~~~
   fs/btrfs/free-space-cache.c:385:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(io_ctl, 0, sizeof(struct btrfs_io_ctl));
           ^~~~~~
   fs/btrfs/free-space-cache.c:755:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D -1;
           ^     ~~
   fs/btrfs/free-space-cache.c:755:2: note: Value stored to 'ret' is never =
read
           ret =3D -1;
           ^     ~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
>> fs/btrfs/zlib.c:151:10: warning: Branch condition evaluates to a garbage=
 value [clang-analyzer-core.uninitialized.Branch]
                                           if (data_in) {
                                               ^~~~~~~
   fs/btrfs/zlib.c:100:2: note: 'data_in' declared without an initial value
           char *data_in;
           ^~~~~~~~~~~~~
   fs/btrfs/zlib.c:115:6: note: Assuming the condition is false
           if (Z_OK !=3D zlib_deflateInit(&workspace->strm, workspace->leve=
l)) {
               ^
   include/linux/zlib.h:148:25: note: expanded from macro 'Z_OK'
   #define Z_OK            0
                           ^
   fs/btrfs/zlib.c:115:2: note: Taking false branch
           if (Z_OK !=3D zlib_deflateInit(&workspace->strm, workspace->leve=
l)) {
           ^
   fs/btrfs/zlib.c:125:6: note: Assuming 'out_page' is not equal to NULL
           if (out_page =3D=3D NULL) {
               ^~~~~~~~~~~~~~~~
   fs/btrfs/zlib.c:125:2: note: Taking false branch
           if (out_page =3D=3D NULL) {
           ^
   fs/btrfs/zlib.c:138:9: note: Assuming 'len' is > field 'total_in'
           while (workspace->strm.total_in < len) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/zlib.c:138:2: note: Loop condition is true.  Entering loop body
           while (workspace->strm.total_in < len) {
           ^
   fs/btrfs/zlib.c:143:23: note: Field 'avail_in' is equal to 0
                   if (workspace->strm.avail_in =3D=3D 0) {
                                       ^
   fs/btrfs/zlib.c:143:3: note: Taking true branch
                   if (workspace->strm.avail_in =3D=3D 0) {
                   ^
   fs/btrfs/zlib.c:145:19: note: Assuming '__UNIQUE_ID___x270' is >=3D '__U=
NIQUE_ID___y271'
                           in_buf_pages =3D min(DIV_ROUND_UP(bytes_left, PA=
GE_SIZE),
                                          ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   fs/btrfs/zlib.c:145:19: note: '?' condition is false
                           in_buf_pages =3D min(DIV_ROUND_UP(bytes_left, PA=
GE_SIZE),
                                          ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
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
   fs/btrfs/zlib.c:147:8: note: Assuming 'in_buf_pages' is > 1
                           if (in_buf_pages > 1) {
                               ^~~~~~~~~~~~~~~~
   fs/btrfs/zlib.c:147:4: note: Taking true branch
                           if (in_buf_pages > 1) {
                           ^
   fs/btrfs/zlib.c:150:17: note: 'i' is < 'in_buf_pages'
                                   for (i =3D 0; i < in_buf_pages; i++) {
                                               ^
   fs/btrfs/zlib.c:150:5: note: Loop condition is true.  Entering loop body
                                   for (i =3D 0; i < in_buf_pages; i++) {
                                   ^
   fs/btrfs/zlib.c:151:10: note: Branch condition evaluates to a garbage va=
lue
                                           if (data_in) {
                                               ^~~~~~~
   fs/btrfs/zlib.c:158:6: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                                           memcpy(workspace->buf + i * PAGE=
_SIZE,
                                           ^~~~~~
   fs/btrfs/zlib.c:158:6: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
                                           memcpy(workspace->buf + i * PAGE=
_SIZE,
                                           ^~~~~~
   fs/btrfs/zlib.c:164:9: warning: Branch condition evaluates to a garbage =
value [clang-analyzer-core.uninitialized.Branch]
                                   if (data_in) {
                                       ^~~~~~~
   fs/btrfs/zlib.c:100:2: note: 'data_in' declared without an initial value
           char *data_in;
           ^~~~~~~~~~~~~
   fs/btrfs/zlib.c:115:6: note: Assuming the condition is false
           if (Z_OK !=3D zlib_deflateInit(&workspace->strm, workspace->leve=
l)) {
               ^
   include/linux/zlib.h:148:25: note: expanded from macro 'Z_OK'
   #define Z_OK            0
                           ^
   fs/btrfs/zlib.c:115:2: note: Taking false branch
           if (Z_OK !=3D zlib_deflateInit(&workspace->strm, workspace->leve=
l)) {
           ^
   fs/btrfs/zlib.c:125:6: note: Assuming 'out_page' is not equal to NULL
           if (out_page =3D=3D NULL) {

vim +151 fs/btrfs/zlib.c

c8b978188c9a0f Chris Mason           2008-10-29   93  =

c4bf665a319755 David Sterba          2019-10-01   94  int zlib_compress_pag=
es(struct list_head *ws, struct address_space *mapping,
c4bf665a319755 David Sterba          2019-10-01   95  		u64 start, struct p=
age **pages, unsigned long *out_pages,
c4bf665a319755 David Sterba          2019-10-01   96  		unsigned long *tota=
l_in, unsigned long *total_out)
c8b978188c9a0f Chris Mason           2008-10-29   97  {
261507a02ccba9 Li Zefan              2010-12-17   98  	struct workspace *wo=
rkspace =3D list_entry(ws, struct workspace, list);
c8b978188c9a0f Chris Mason           2008-10-29   99  	int ret;
c8b978188c9a0f Chris Mason           2008-10-29  100  	char *data_in;
c8b978188c9a0f Chris Mason           2008-10-29  101  	char *cpage_out;
c8b978188c9a0f Chris Mason           2008-10-29  102  	int nr_pages =3D 0;
c8b978188c9a0f Chris Mason           2008-10-29  103  	struct page *in_page=
 =3D NULL;
c8b978188c9a0f Chris Mason           2008-10-29  104  	struct page *out_pag=
e =3D NULL;
c8b978188c9a0f Chris Mason           2008-10-29  105  	unsigned long bytes_=
left;
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  106  	unsigned int in_buf_=
pages;
38c31464089f63 David Sterba          2017-02-14  107  	unsigned long len =
=3D *total_out;
4d3a800ebb1299 David Sterba          2017-02-14  108  	unsigned long nr_des=
t_pages =3D *out_pages;
e5d74902362f1a David Sterba          2017-02-14  109  	const unsigned long =
max_out =3D nr_dest_pages * PAGE_SIZE;
c8b978188c9a0f Chris Mason           2008-10-29  110  =

c8b978188c9a0f Chris Mason           2008-10-29  111  	*out_pages =3D 0;
c8b978188c9a0f Chris Mason           2008-10-29  112  	*total_out =3D 0;
c8b978188c9a0f Chris Mason           2008-10-29  113  	*total_in =3D 0;
c8b978188c9a0f Chris Mason           2008-10-29  114  =

f51d2b59120ff3 David Sterba          2017-09-15  115  	if (Z_OK !=3D zlib_d=
eflateInit(&workspace->strm, workspace->level)) {
62e855771dacf7 Jeff Mahoney          2016-09-20  116  		pr_warn("BTRFS: def=
lateInit failed\n");
60e1975acb48fc Zach Brown            2014-05-09  117  		ret =3D -EIO;
c8b978188c9a0f Chris Mason           2008-10-29  118  		goto out;
c8b978188c9a0f Chris Mason           2008-10-29  119  	}
c8b978188c9a0f Chris Mason           2008-10-29  120  =

7880991344f736 Sergey Senozhatsky    2014-07-07  121  	workspace->strm.tota=
l_in =3D 0;
7880991344f736 Sergey Senozhatsky    2014-07-07  122  	workspace->strm.tota=
l_out =3D 0;
c8b978188c9a0f Chris Mason           2008-10-29  123  =

b0ee5e1ec44afd David Sterba          2021-06-14  124  	out_page =3D alloc_p=
age(GFP_NOFS);
4b72029dc3fd6b Li Zefan              2010-11-09  125  	if (out_page =3D=3D =
NULL) {
60e1975acb48fc Zach Brown            2014-05-09  126  		ret =3D -ENOMEM;
4b72029dc3fd6b Li Zefan              2010-11-09  127  		goto out;
4b72029dc3fd6b Li Zefan              2010-11-09  128  	}
a549d3a90067e8 Fabio M. De Francesco 2022-05-31  129  	cpage_out =3D kmap_l=
ocal_page(out_page);
c8b978188c9a0f Chris Mason           2008-10-29  130  	pages[0] =3D out_pag=
e;
c8b978188c9a0f Chris Mason           2008-10-29  131  	nr_pages =3D 1;
c8b978188c9a0f Chris Mason           2008-10-29  132  =

3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  133  	workspace->strm.next=
_in =3D workspace->buf;
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  134  	workspace->strm.avai=
l_in =3D 0;
7880991344f736 Sergey Senozhatsky    2014-07-07  135  	workspace->strm.next=
_out =3D cpage_out;
09cbfeaf1a5a67 Kirill A. Shutemov    2016-04-01  136  	workspace->strm.avai=
l_out =3D PAGE_SIZE;
c8b978188c9a0f Chris Mason           2008-10-29  137  =

7880991344f736 Sergey Senozhatsky    2014-07-07  138  	while (workspace->st=
rm.total_in < len) {
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  139  		/*
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  140  		 * Get next input p=
ages and copy the contents to
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  141  		 * the workspace bu=
ffer if required.
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  142  		 */
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  143  		if (workspace->strm=
.avail_in =3D=3D 0) {
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  144  			bytes_left =3D len=
 - workspace->strm.total_in;
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  145  			in_buf_pages =3D m=
in(DIV_ROUND_UP(bytes_left, PAGE_SIZE),
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  146  					   workspace->bu=
f_size / PAGE_SIZE);
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  147  			if (in_buf_pages >=
 1) {
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  148  				int i;
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  149  =

3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  150  				for (i =3D 0; i <=
 in_buf_pages; i++) {
a549d3a90067e8 Fabio M. De Francesco 2022-05-31 @151  					if (data_in) {
a549d3a90067e8 Fabio M. De Francesco 2022-05-31  152  						kunmap_local(da=
ta_in);
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  153  						put_page(in_pag=
e);
55276e14df4324 David Sterba          2021-10-27  154  					}
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  155  					in_page =3D find=
_get_page(mapping,
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  156  								start >> PAGE=
_SHIFT);
a549d3a90067e8 Fabio M. De Francesco 2022-05-31  157  					data_in =3D kmap=
_local_page(in_page);
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  158  					memcpy(workspace=
->buf + i * PAGE_SIZE,
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  159  					       data_in, =
PAGE_SIZE);
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  160  					start +=3D PAGE_=
SIZE;
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  161  				}
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  162  				workspace->strm.n=
ext_in =3D workspace->buf;
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  163  			} else {
a549d3a90067e8 Fabio M. De Francesco 2022-05-31  164  				if (data_in) {
a549d3a90067e8 Fabio M. De Francesco 2022-05-31  165  					kunmap_local(dat=
a_in);
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  166  					put_page(in_page=
);
55276e14df4324 David Sterba          2021-10-27  167  				}
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  168  				in_page =3D find_=
get_page(mapping,
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  169  							start >> PAGE_=
SHIFT);
a549d3a90067e8 Fabio M. De Francesco 2022-05-31  170  				data_in =3D kmap_=
local_page(in_page);
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  171  				start +=3D PAGE_S=
IZE;
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  172  				workspace->strm.n=
ext_in =3D data_in;
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  173  			}
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  174  			workspace->strm.av=
ail_in =3D min(bytes_left,
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  175  						       (unsigne=
d long) workspace->buf_size);
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  176  		}
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  177  =

7880991344f736 Sergey Senozhatsky    2014-07-07  178  		ret =3D zlib_deflat=
e(&workspace->strm, Z_SYNC_FLUSH);
c8b978188c9a0f Chris Mason           2008-10-29  179  		if (ret !=3D Z_OK) {
62e855771dacf7 Jeff Mahoney          2016-09-20  180  			pr_debug("BTRFS: d=
eflate in loop returned %d\n",
c8b978188c9a0f Chris Mason           2008-10-29  181  			       ret);
7880991344f736 Sergey Senozhatsky    2014-07-07  182  			zlib_deflateEnd(&w=
orkspace->strm);
60e1975acb48fc Zach Brown            2014-05-09  183  			ret =3D -EIO;
c8b978188c9a0f Chris Mason           2008-10-29  184  			goto out;
c8b978188c9a0f Chris Mason           2008-10-29  185  		}
c8b978188c9a0f Chris Mason           2008-10-29  186  =

c8b978188c9a0f Chris Mason           2008-10-29  187  		/* we're making it =
bigger, give up */
7880991344f736 Sergey Senozhatsky    2014-07-07  188  		if (workspace->strm=
.total_in > 8192 &&
7880991344f736 Sergey Senozhatsky    2014-07-07  189  		    workspace->strm=
.total_in <
7880991344f736 Sergey Senozhatsky    2014-07-07  190  		    workspace->strm=
.total_out) {
130d5b415a091e David Sterba          2014-06-20  191  			ret =3D -E2BIG;
c8b978188c9a0f Chris Mason           2008-10-29  192  			goto out;
c8b978188c9a0f Chris Mason           2008-10-29  193  		}
c8b978188c9a0f Chris Mason           2008-10-29  194  		/* we need another =
page for writing out.  Test this
c8b978188c9a0f Chris Mason           2008-10-29  195  		 * before the total=
_in so we will pull in a new page for
c8b978188c9a0f Chris Mason           2008-10-29  196  		 * the stream end i=
f required
c8b978188c9a0f Chris Mason           2008-10-29  197  		 */
7880991344f736 Sergey Senozhatsky    2014-07-07  198  		if (workspace->strm=
.avail_out =3D=3D 0) {
a549d3a90067e8 Fabio M. De Francesco 2022-05-31  199  			kunmap_local(cpage=
_out);
c8b978188c9a0f Chris Mason           2008-10-29  200  			if (nr_pages =3D=
=3D nr_dest_pages) {
c8b978188c9a0f Chris Mason           2008-10-29  201  				out_page =3D NULL;
60e1975acb48fc Zach Brown            2014-05-09  202  				ret =3D -E2BIG;
c8b978188c9a0f Chris Mason           2008-10-29  203  				goto out;
c8b978188c9a0f Chris Mason           2008-10-29  204  			}
b0ee5e1ec44afd David Sterba          2021-06-14  205  			out_page =3D alloc=
_page(GFP_NOFS);
4b72029dc3fd6b Li Zefan              2010-11-09  206  			if (out_page =3D=
=3D NULL) {
60e1975acb48fc Zach Brown            2014-05-09  207  				ret =3D -ENOMEM;
4b72029dc3fd6b Li Zefan              2010-11-09  208  				goto out;
4b72029dc3fd6b Li Zefan              2010-11-09  209  			}
a549d3a90067e8 Fabio M. De Francesco 2022-05-31  210  			cpage_out =3D kmap=
_local_page(out_page);
c8b978188c9a0f Chris Mason           2008-10-29  211  			pages[nr_pages] =
=3D out_page;
c8b978188c9a0f Chris Mason           2008-10-29  212  			nr_pages++;
09cbfeaf1a5a67 Kirill A. Shutemov    2016-04-01  213  			workspace->strm.av=
ail_out =3D PAGE_SIZE;
7880991344f736 Sergey Senozhatsky    2014-07-07  214  			workspace->strm.ne=
xt_out =3D cpage_out;
c8b978188c9a0f Chris Mason           2008-10-29  215  		}
c8b978188c9a0f Chris Mason           2008-10-29  216  		/* we're all done */
7880991344f736 Sergey Senozhatsky    2014-07-07  217  		if (workspace->strm=
.total_in >=3D len)
c8b978188c9a0f Chris Mason           2008-10-29  218  			break;
7880991344f736 Sergey Senozhatsky    2014-07-07  219  		if (workspace->strm=
.total_out > max_out)
c8b978188c9a0f Chris Mason           2008-10-29  220  			break;
c8b978188c9a0f Chris Mason           2008-10-29  221  	}
7880991344f736 Sergey Senozhatsky    2014-07-07  222  	workspace->strm.avai=
l_in =3D 0;
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  223  	/*
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  224  	 * Call deflate with=
 Z_FINISH flush parameter providing more output
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  225  	 * space but no more=
 input data, until it returns with Z_STREAM_END.
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  226  	 */
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  227  	while (ret !=3D Z_ST=
REAM_END) {
7880991344f736 Sergey Senozhatsky    2014-07-07  228  		ret =3D zlib_deflat=
e(&workspace->strm, Z_FINISH);
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  229  		if (ret =3D=3D Z_ST=
REAM_END)
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  230  			break;
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  231  		if (ret !=3D Z_OK &=
& ret !=3D Z_BUF_ERROR) {
7880991344f736 Sergey Senozhatsky    2014-07-07  232  			zlib_deflateEnd(&w=
orkspace->strm);
60e1975acb48fc Zach Brown            2014-05-09  233  			ret =3D -EIO;
c8b978188c9a0f Chris Mason           2008-10-29  234  			goto out;
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  235  		} else if (workspac=
e->strm.avail_out =3D=3D 0) {
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  236  			/* get another pag=
e for the stream end */
a549d3a90067e8 Fabio M. De Francesco 2022-05-31  237  			kunmap_local(cpage=
_out);
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  238  			if (nr_pages =3D=
=3D nr_dest_pages) {
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  239  				out_page =3D NULL;
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  240  				ret =3D -E2BIG;
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  241  				goto out;
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  242  			}
b0ee5e1ec44afd David Sterba          2021-06-14  243  			out_page =3D alloc=
_page(GFP_NOFS);
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  244  			if (out_page =3D=
=3D NULL) {
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  245  				ret =3D -ENOMEM;
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  246  				goto out;
c8b978188c9a0f Chris Mason           2008-10-29  247  			}
a549d3a90067e8 Fabio M. De Francesco 2022-05-31  248  			cpage_out =3D kmap=
_local_page(out_page);
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  249  			pages[nr_pages] =
=3D out_page;
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  250  			nr_pages++;
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  251  			workspace->strm.av=
ail_out =3D PAGE_SIZE;
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  252  			workspace->strm.ne=
xt_out =3D cpage_out;
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  253  		}
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  254  	}
3fd396afc05fc9 Mikhail Zaslonko      2020-01-30  255  	zlib_deflateEnd(&wor=
kspace->strm);
c8b978188c9a0f Chris Mason           2008-10-29  256  =

7880991344f736 Sergey Senozhatsky    2014-07-07  257  	if (workspace->strm.=
total_out >=3D workspace->strm.total_in) {
60e1975acb48fc Zach Brown            2014-05-09  258  		ret =3D -E2BIG;
c8b978188c9a0f Chris Mason           2008-10-29  259  		goto out;
c8b978188c9a0f Chris Mason           2008-10-29  260  	}
c8b978188c9a0f Chris Mason           2008-10-29  261  =

c8b978188c9a0f Chris Mason           2008-10-29  262  	ret =3D 0;
7880991344f736 Sergey Senozhatsky    2014-07-07  263  	*total_out =3D works=
pace->strm.total_out;
7880991344f736 Sergey Senozhatsky    2014-07-07  264  	*total_in =3D worksp=
ace->strm.total_in;
c8b978188c9a0f Chris Mason           2008-10-29  265  out:
c8b978188c9a0f Chris Mason           2008-10-29  266  	*out_pages =3D nr_pa=
ges;
a549d3a90067e8 Fabio M. De Francesco 2022-05-31  267  	if (cpage_out)
a549d3a90067e8 Fabio M. De Francesco 2022-05-31  268  		kunmap_local(cpage_=
out);
55276e14df4324 David Sterba          2021-10-27  269  =

a549d3a90067e8 Fabio M. De Francesco 2022-05-31  270  	if (data_in) {
a549d3a90067e8 Fabio M. De Francesco 2022-05-31  271  		kunmap_local(data_i=
n);
09cbfeaf1a5a67 Kirill A. Shutemov    2016-04-01  272  		put_page(in_page);
55276e14df4324 David Sterba          2021-10-27  273  	}
c8b978188c9a0f Chris Mason           2008-10-29  274  	return ret;
c8b978188c9a0f Chris Mason           2008-10-29  275  }
c8b978188c9a0f Chris Mason           2008-10-29  276  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3831631177412853266==--

