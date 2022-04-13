Content-Type: multipart/mixed; boundary="===============7406958831596598918=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hch-misc:nvme-passthrough-refactor 6/8] drivers/nvme/host/ioctl.c:55:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 14 Apr 2022 06:11:59 +0800
Message-ID: <202204140641.IuDNiGzX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7406958831596598918==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/misc.git nvme-passthrough-refactor
head:   6babda2192a23c68b5c750d2968f53a7b4be8ed3
commit: 535315bf82007e19aad878b078d9a8772bb5afd5 [6/8] nvme: factor out a n=
vme_free_user_metadata helper
:::::: branch date: 16 hours ago
:::::: commit date: 17 hours ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
414/202204140641.IuDNiGzX-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6b7e6e=
a489f6dd45a9b0da9ac20871560917b9b0)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hch-misc git://git.infradead.org/users/hch/misc.git
        git fetch --no-tags hch-misc nvme-passthrough-refactor
        git checkout 535315bf82007e19aad878b078d9a8772bb5afd5
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                           ^~~~~~~~~~~~~~~~
   net/mptcp/options.c:578:3: warning: Value stored to 'remaining' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   remaining -=3D map_size;
                   ^            ~~~~~~~~
   net/mptcp/options.c:578:3: note: Value stored to 'remaining' is never re=
ad
                   remaining -=3D map_size;
                   ^            ~~~~~~~~
   net/mptcp/options.c:629:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&msg[i], &addr->addr.s_addr, 4);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   net/mptcp/options.c:629:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(&msg[i], &addr->addr.s_addr, 4);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   net/mptcp/options.c:634:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&msg[i], &addr->addr6.s6_addr, 16);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   net/mptcp/options.c:634:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(&msg[i], &addr->addr6.s6_addr, 16);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   net/mptcp/options.c:841:4: warning: Value stored to 'remaining' is never=
 read [clang-analyzer-deadcode.DeadStores]
                           remaining -=3D opt_size;
                           ^            ~~~~~~~~
   net/mptcp/options.c:841:4: note: Value stored to 'remaining' is never re=
ad
                           remaining -=3D opt_size;
                           ^            ~~~~~~~~
   net/mptcp/options.c:857:4: warning: Value stored to 'remaining' is never=
 read [clang-analyzer-deadcode.DeadStores]
                           remaining -=3D opt_size - mp_fail_size;
                           ^            ~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/options.c:857:4: note: Value stored to 'remaining' is never re=
ad
                           remaining -=3D opt_size - mp_fail_size;
                           ^            ~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/options.c:882:3: warning: Value stored to 'remaining' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   remaining -=3D opt_size;
                   ^            ~~~~~~~~
   net/mptcp/options.c:882:3: note: Value stored to 'remaining' is never re=
ad
                   remaining -=3D opt_size;
                   ^            ~~~~~~~~
   net/mptcp/options.c:1196:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(mpext, 0, sizeof(*mpext));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   net/mptcp/options.c:1196:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(mpext, 0, sizeof(*mpext));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   net/mptcp/options.c:1428:4: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(ptr, opts->hmac, MPTCPOPT_HMAC_LEN);
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   net/mptcp/options.c:1428:4: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                           memcpy(ptr, opts->hmac, MPTCPOPT_HMAC_LEN);
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   net/mptcp/options.c:1451:4: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy((u8 *)ptr, (u8 *)&opts->addr.addr.s_addr,=
 4);
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   net/mptcp/options.c:1451:4: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                           memcpy((u8 *)ptr, (u8 *)&opts->addr.addr.s_addr,=
 4);
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   net/mptcp/options.c:1456:4: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy((u8 *)ptr, opts->addr.addr6.s6_addr, 16);
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   net/mptcp/options.c:1456:4: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                           memcpy((u8 *)ptr, opts->addr.addr6.s6_addr, 16);
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 101 warnings (100 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
>> drivers/nvme/host/ioctl.c:55:2: warning: Value stored to 'ret' is never =
read [clang-analyzer-deadcode.DeadStores]
           ret =3D -ENOMEM;
           ^     ~~~~~~~
   drivers/nvme/host/ioctl.c:55:2: note: Value stored to 'ret' is never read
           ret =3D -ENOMEM;
           ^     ~~~~~~~
   drivers/nvme/host/ioctl.c:180:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&c, 0, sizeof(c));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/nvme/host/ioctl.c:180:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(&c, 0, sizeof(c));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/nvme/host/ioctl.c:230:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&c, 0, sizeof(c));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/nvme/host/ioctl.c:230:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(&c, 0, sizeof(c));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/nvme/host/ioctl.c:276:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&c, 0, sizeof(c));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/nvme/host/ioctl.c:276:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(&c, 0, sizeof(c));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   include/linux/bio.h:343:6: warning: Access to field 'bi_opf' results in =
a dereference of a null pointer (loaded from variable 'bio') [clang-analyze=
r-core.NullDereference]
           if (bio->bi_opf & REQ_INTEGRITY)
               ^
   drivers/nvme/host/ioctl.c:75:30: note: Assuming 'ns' is null
           struct block_device *bdev =3D ns ? ns->disk->part0 : NULL;
                                       ^~
   drivers/nvme/host/ioctl.c:75:30: note: '?' condition is false
   drivers/nvme/host/ioctl.c:77:2: note: 'bio' initialized to a null pointe=
r value
           struct bio *bio =3D NULL;
           ^~~~~~~~~~~~~~~
   drivers/nvme/host/ioctl.c:81:2: note: '?' condition is false
           if (IS_ERR(req))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/nvme/host/ioctl.c:81:2: note: '?' condition is false
           if (IS_ERR(req))
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
   drivers/nvme/host/ioctl.c:81:2: note: Taking false branch
           if (IS_ERR(req))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/nvme/host/ioctl.c:85:2: note: Assuming 'timeout' is 0
           if (timeout)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/nvme/host/ioctl.c:85:2: note: '?' condition is false
           if (timeout)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/nvme/host/ioctl.c:85:6: note: 'timeout' is 0
           if (timeout)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'

vim +/ret +55 drivers/nvme/host/ioctl.c

535315bf82007e Christoph Hellwig 2022-04-13  33  =

535315bf82007e Christoph Hellwig 2022-04-13  34  static int nvme_add_user_m=
etadata(struct bio *bio, void __user *ubuf,
ab4e70a52d71e6 Christoph Hellwig 2022-04-13  35  		unsigned len, u32 seed)
2405252a680e21 Christoph Hellwig 2021-04-10  36  {
2405252a680e21 Christoph Hellwig 2021-04-10  37  	struct bio_integrity_payl=
oad *bip;
2405252a680e21 Christoph Hellwig 2021-04-10  38  	void *buf;
535315bf82007e Christoph Hellwig 2022-04-13  39  	int ret;
2405252a680e21 Christoph Hellwig 2021-04-10  40  =

2405252a680e21 Christoph Hellwig 2021-04-10  41  	buf =3D kmalloc(len, GFP_=
KERNEL);
2405252a680e21 Christoph Hellwig 2021-04-10  42  	if (!buf)
535315bf82007e Christoph Hellwig 2022-04-13  43  		return -ENOMEM;
2405252a680e21 Christoph Hellwig 2021-04-10  44  =

2405252a680e21 Christoph Hellwig 2021-04-10  45  	ret =3D -EFAULT;
ab4e70a52d71e6 Christoph Hellwig 2022-04-13  46  	if (bio_op(bio) =3D=3D RE=
Q_OP_DRV_OUT && copy_from_user(buf, ubuf, len))
2405252a680e21 Christoph Hellwig 2021-04-10  47  		goto out_free_meta;
2405252a680e21 Christoph Hellwig 2021-04-10  48  =

2405252a680e21 Christoph Hellwig 2021-04-10  49  	bip =3D bio_integrity_all=
oc(bio, GFP_KERNEL, 1);
2405252a680e21 Christoph Hellwig 2021-04-10  50  	if (IS_ERR(bip)) {
2405252a680e21 Christoph Hellwig 2021-04-10  51  		ret =3D PTR_ERR(bip);
2405252a680e21 Christoph Hellwig 2021-04-10  52  		goto out_free_meta;
2405252a680e21 Christoph Hellwig 2021-04-10  53  	}
2405252a680e21 Christoph Hellwig 2021-04-10  54  =

535315bf82007e Christoph Hellwig 2022-04-13 @55  	ret =3D -ENOMEM;
2405252a680e21 Christoph Hellwig 2021-04-10  56  	bip->bip_iter.bi_size =3D=
 len;
2405252a680e21 Christoph Hellwig 2021-04-10  57  	bip->bip_iter.bi_sector =
=3D seed;
2405252a680e21 Christoph Hellwig 2021-04-10  58  	ret =3D bio_integrity_add=
_page(bio, virt_to_page(buf), len,
2405252a680e21 Christoph Hellwig 2021-04-10  59  			offset_in_page(buf));
535315bf82007e Christoph Hellwig 2022-04-13  60  	if (ret !=3D len)
535315bf82007e Christoph Hellwig 2022-04-13  61  		goto out_free_meta;
535315bf82007e Christoph Hellwig 2022-04-13  62  	return 0;
535315bf82007e Christoph Hellwig 2022-04-13  63  =

2405252a680e21 Christoph Hellwig 2021-04-10  64  out_free_meta:
2405252a680e21 Christoph Hellwig 2021-04-10  65  	kfree(buf);
535315bf82007e Christoph Hellwig 2022-04-13  66  	return ret;
2405252a680e21 Christoph Hellwig 2021-04-10  67  }
2405252a680e21 Christoph Hellwig 2021-04-10  68  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7406958831596598918==--

