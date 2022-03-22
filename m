Content-Type: multipart/mixed; boundary="===============2961168217868832838=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:bpf/bpf-next/master 244/270] kernel/bpf/bpf_local_storage.c:473:2: warning: Potential leak of memory pointed to by 'selem' [clang-analyzer-unix.Malloc]
Date: Tue, 22 Mar 2022 21:13:24 +0800
Message-ID: <202203222134.Yjg9BagC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2961168217868832838==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Joanne Koong <joannelkoong@gmail.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://github.com/ammarfaizi2/linux-block bpf/bpf-next/master
head:   e52b8f5bd3d2f7b2f4b98067db33bc2fdc125643
commit: b00fa38a9c1cba044a32a601b49a55a18ed719d1 [244/270] bpf: Enable non-=
atomic allocations in local storage
:::::: branch date: 8 hours ago
:::::: commit date: 35 hours ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
322/202203222134.Yjg9BagC-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 85e9b2=
687a13d1908aa86d1b89c5ce398a06cd39)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/b00fa38a9c1cba0=
44a32a601b49a55a18ed719d1
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block bpf/bpf-next/master
        git checkout b00fa38a9c1cba044a32a601b49a55a18ed719d1
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   crypto/xor.c:155:2: note: Left side of '&&' is true
           pr_info("xor: using function: %s (%d MB/sec)\n",
           ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:370:7: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                       ^
   crypto/xor.c:155:2: note: Taking true branch
           pr_info("xor: using function: %s (%d MB/sec)\n",
           ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:370:3: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   crypto/xor.c:155:2: note: '?' condition is true
           pr_info("xor: using function: %s (%d MB/sec)\n",
           ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:379:12: note: expanded from macro '__printk_index=
_emit'
                                   .fmt =3D __builtin_constant_p(_fmt) ? (_=
fmt) : NULL, \
                                          ^
   crypto/xor.c:155:2: note: '?' condition is true
           pr_info("xor: using function: %s (%d MB/sec)\n",
           ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:383:14: note: expanded from macro '__printk_index=
_emit'
                                   .level =3D __builtin_constant_p(_level) =
? (_level) : NULL, \
                                            ^
   crypto/xor.c:155:2: note: Loop condition is false.  Exiting loop
           pr_info("xor: using function: %s (%d MB/sec)\n",
           ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:369:2: note: expanded from macro '__printk_index_=
emit'
           do {                                                            \
           ^
   crypto/xor.c:156:9: note: Access to field 'name' results in a dereferenc=
e of a null pointer (loaded from variable 'fastest')
                  fastest->name, fastest->speed);
                  ^
   include/linux/printk.h:519:34: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
                                           ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> kernel/bpf/bpf_local_storage.c:473:2: warning: Potential leak of memory =
pointed to by 'selem' [clang-analyzer-unix.Malloc]
           raw_spin_unlock_irqrestore(&local_storage->lock, flags);
           ^
   include/linux/spinlock.h:279:13: note: expanded from macro 'raw_spin_unl=
ock_irqrestore'
                   typecheck(unsigned long, flags);                \
                             ^
   kernel/bpf/bpf_local_storage.c:363:15: note: Assuming the condition is f=
alse
           if (unlikely((map_flags & ~BPF_F_LOCK) > BPF_EXIST) ||
                        ^
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   kernel/bpf/bpf_local_storage.c:363:6: note: Left side of '||' is false
           if (unlikely((map_flags & ~BPF_F_LOCK) > BPF_EXIST) ||
               ^
   include/linux/compiler.h:48:23: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                           ^
   kernel/bpf/bpf_local_storage.c:365:16: note: Assuming the condition is t=
rue
               unlikely((map_flags & BPF_F_LOCK) &&
                         ^
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   kernel/bpf/bpf_local_storage.c:365:15: note: Left side of '&&' is true
               unlikely((map_flags & BPF_F_LOCK) &&
                        ^
   kernel/bpf/bpf_local_storage.c:365:15: note: Left side of '&&' is true
   kernel/bpf/bpf_local_storage.c:363:2: note: '?' condition is false
           if (unlikely((map_flags & ~BPF_F_LOCK) > BPF_EXIST) ||
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   kernel/bpf/bpf_local_storage.c:363:6: note: Left side of '||' is false
           if (unlikely((map_flags & ~BPF_F_LOCK) > BPF_EXIST) ||
               ^
   include/linux/compiler.h:48:23: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                           ^
   kernel/bpf/bpf_local_storage.c:365:15: note: Left side of '&&' is true
               unlikely((map_flags & BPF_F_LOCK) &&
                        ^
   kernel/bpf/bpf_local_storage.c:365:15: note: Left side of '&&' is true
   kernel/bpf/bpf_local_storage.c:363:2: note: '?' condition is false
           if (unlikely((map_flags & ~BPF_F_LOCK) > BPF_EXIST) ||
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
   kernel/bpf/bpf_local_storage.c:363:2: note: Taking false branch
           if (unlikely((map_flags & ~BPF_F_LOCK) > BPF_EXIST) ||
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   kernel/bpf/bpf_local_storage.c:369:6: note: Assuming the condition is tr=
ue
           if (gfp_flags =3D=3D GFP_KERNEL && (map_flags & ~BPF_F_LOCK) !=
=3D BPF_NOEXIST)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   kernel/bpf/bpf_local_storage.c:369:6: note: Left side of '&&' is true
           if (gfp_flags =3D=3D GFP_KERNEL && (map_flags & ~BPF_F_LOCK) !=
=3D BPF_NOEXIST)
               ^
   kernel/bpf/bpf_local_storage.c:369:33: note: Assuming the condition is f=
alse
           if (gfp_flags =3D=3D GFP_KERNEL && (map_flags & ~BPF_F_LOCK) !=
=3D BPF_NOEXIST)
                                          ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~

vim +/selem +473 kernel/bpf/bpf_local_storage.c

450af8d0f6be2e7 KP Singh     2020-08-25  346  =

450af8d0f6be2e7 KP Singh     2020-08-25  347  /* sk cannot be going away be=
cause it is linking new elem
450af8d0f6be2e7 KP Singh     2020-08-25  348   * to sk->sk_bpf_storage. (i.=
e. sk->sk_refcnt cannot be 0).
450af8d0f6be2e7 KP Singh     2020-08-25  349   * Otherwise, it will become =
a leak (and other memory issues
450af8d0f6be2e7 KP Singh     2020-08-25  350   * during map destruction).
450af8d0f6be2e7 KP Singh     2020-08-25  351   */
450af8d0f6be2e7 KP Singh     2020-08-25  352  struct bpf_local_storage_data=
 *
450af8d0f6be2e7 KP Singh     2020-08-25  353  bpf_local_storage_update(void=
 *owner, struct bpf_local_storage_map *smap,
b00fa38a9c1cba0 Joanne Koong 2022-03-17  354  			 void *value, u64 map_flag=
s, gfp_t gfp_flags)
450af8d0f6be2e7 KP Singh     2020-08-25  355  {
450af8d0f6be2e7 KP Singh     2020-08-25  356  	struct bpf_local_storage_dat=
a *old_sdata =3D NULL;
b00fa38a9c1cba0 Joanne Koong 2022-03-17  357  	struct bpf_local_storage_ele=
m *selem =3D NULL;
450af8d0f6be2e7 KP Singh     2020-08-25  358  	struct bpf_local_storage *lo=
cal_storage;
a10787e6d58c24b Song Liu     2021-02-25  359  	unsigned long flags;
450af8d0f6be2e7 KP Singh     2020-08-25  360  	int err;
450af8d0f6be2e7 KP Singh     2020-08-25  361  =

450af8d0f6be2e7 KP Singh     2020-08-25  362  	/* BPF_EXIST and BPF_NOEXIST=
 cannot be both set */
450af8d0f6be2e7 KP Singh     2020-08-25  363  	if (unlikely((map_flags & ~B=
PF_F_LOCK) > BPF_EXIST) ||
450af8d0f6be2e7 KP Singh     2020-08-25  364  	    /* BPF_F_LOCK can only b=
e used in a value with spin_lock */
450af8d0f6be2e7 KP Singh     2020-08-25  365  	    unlikely((map_flags & BP=
F_F_LOCK) &&
450af8d0f6be2e7 KP Singh     2020-08-25  366  		     !map_value_has_spin_lo=
ck(&smap->map)))
450af8d0f6be2e7 KP Singh     2020-08-25  367  		return ERR_PTR(-EINVAL);
450af8d0f6be2e7 KP Singh     2020-08-25  368  =

b00fa38a9c1cba0 Joanne Koong 2022-03-17  369  	if (gfp_flags =3D=3D GFP_KER=
NEL && (map_flags & ~BPF_F_LOCK) !=3D BPF_NOEXIST)
b00fa38a9c1cba0 Joanne Koong 2022-03-17  370  		return ERR_PTR(-EINVAL);
b00fa38a9c1cba0 Joanne Koong 2022-03-17  371  =

0fe4b381a59ebc5 KP Singh     2021-12-24  372  	local_storage =3D rcu_derefe=
rence_check(*owner_storage(smap, owner),
0fe4b381a59ebc5 KP Singh     2021-12-24  373  					      bpf_rcu_lock_held(=
));
450af8d0f6be2e7 KP Singh     2020-08-25  374  	if (!local_storage || hlist_=
empty(&local_storage->list)) {
450af8d0f6be2e7 KP Singh     2020-08-25  375  		/* Very first elem for the =
owner */
450af8d0f6be2e7 KP Singh     2020-08-25  376  		err =3D check_flags(NULL, m=
ap_flags);
450af8d0f6be2e7 KP Singh     2020-08-25  377  		if (err)
450af8d0f6be2e7 KP Singh     2020-08-25  378  			return ERR_PTR(err);
450af8d0f6be2e7 KP Singh     2020-08-25  379  =

b00fa38a9c1cba0 Joanne Koong 2022-03-17  380  		selem =3D bpf_selem_alloc(s=
map, owner, value, true, gfp_flags);
450af8d0f6be2e7 KP Singh     2020-08-25  381  		if (!selem)
450af8d0f6be2e7 KP Singh     2020-08-25  382  			return ERR_PTR(-ENOMEM);
450af8d0f6be2e7 KP Singh     2020-08-25  383  =

b00fa38a9c1cba0 Joanne Koong 2022-03-17  384  		err =3D bpf_local_storage_a=
lloc(owner, smap, selem, gfp_flags);
450af8d0f6be2e7 KP Singh     2020-08-25  385  		if (err) {
450af8d0f6be2e7 KP Singh     2020-08-25  386  			kfree(selem);
450af8d0f6be2e7 KP Singh     2020-08-25  387  			mem_uncharge(smap, owner, =
smap->elem_size);
450af8d0f6be2e7 KP Singh     2020-08-25  388  			return ERR_PTR(err);
450af8d0f6be2e7 KP Singh     2020-08-25  389  		}
450af8d0f6be2e7 KP Singh     2020-08-25  390  =

450af8d0f6be2e7 KP Singh     2020-08-25  391  		return SDATA(selem);
450af8d0f6be2e7 KP Singh     2020-08-25  392  	}
450af8d0f6be2e7 KP Singh     2020-08-25  393  =

450af8d0f6be2e7 KP Singh     2020-08-25  394  	if ((map_flags & BPF_F_LOCK)=
 && !(map_flags & BPF_NOEXIST)) {
450af8d0f6be2e7 KP Singh     2020-08-25  395  		/* Hoping to find an old_sd=
ata to do inline update
450af8d0f6be2e7 KP Singh     2020-08-25  396  		 * such that it can avoid t=
aking the local_storage->lock
450af8d0f6be2e7 KP Singh     2020-08-25  397  		 * and changing the lists.
450af8d0f6be2e7 KP Singh     2020-08-25  398  		 */
450af8d0f6be2e7 KP Singh     2020-08-25  399  		old_sdata =3D
450af8d0f6be2e7 KP Singh     2020-08-25  400  			bpf_local_storage_lookup(l=
ocal_storage, smap, false);
450af8d0f6be2e7 KP Singh     2020-08-25  401  		err =3D check_flags(old_sda=
ta, map_flags);
450af8d0f6be2e7 KP Singh     2020-08-25  402  		if (err)
450af8d0f6be2e7 KP Singh     2020-08-25  403  			return ERR_PTR(err);
450af8d0f6be2e7 KP Singh     2020-08-25  404  		if (old_sdata && selem_link=
ed_to_storage(SELEM(old_sdata))) {
450af8d0f6be2e7 KP Singh     2020-08-25  405  			copy_map_value_locked(&sma=
p->map, old_sdata->data,
450af8d0f6be2e7 KP Singh     2020-08-25  406  					      value, false);
450af8d0f6be2e7 KP Singh     2020-08-25  407  			return old_sdata;
450af8d0f6be2e7 KP Singh     2020-08-25  408  		}
450af8d0f6be2e7 KP Singh     2020-08-25  409  	}
450af8d0f6be2e7 KP Singh     2020-08-25  410  =

b00fa38a9c1cba0 Joanne Koong 2022-03-17  411  	if (gfp_flags =3D=3D GFP_KER=
NEL) {
b00fa38a9c1cba0 Joanne Koong 2022-03-17  412  		selem =3D bpf_selem_alloc(s=
map, owner, value, true, gfp_flags);
b00fa38a9c1cba0 Joanne Koong 2022-03-17  413  		if (!selem)
b00fa38a9c1cba0 Joanne Koong 2022-03-17  414  			return ERR_PTR(-ENOMEM);
b00fa38a9c1cba0 Joanne Koong 2022-03-17  415  	}
b00fa38a9c1cba0 Joanne Koong 2022-03-17  416  =

a10787e6d58c24b Song Liu     2021-02-25  417  	raw_spin_lock_irqsave(&local=
_storage->lock, flags);
450af8d0f6be2e7 KP Singh     2020-08-25  418  =

450af8d0f6be2e7 KP Singh     2020-08-25  419  	/* Recheck local_storage->li=
st under local_storage->lock */
450af8d0f6be2e7 KP Singh     2020-08-25  420  	if (unlikely(hlist_empty(&lo=
cal_storage->list))) {
450af8d0f6be2e7 KP Singh     2020-08-25  421  		/* A parallel del is happen=
ing and local_storage is going
450af8d0f6be2e7 KP Singh     2020-08-25  422  		 * away.  It has just been =
checked before, so very
450af8d0f6be2e7 KP Singh     2020-08-25  423  		 * unlikely.  Return instea=
d of retry to keep things
450af8d0f6be2e7 KP Singh     2020-08-25  424  		 * simple.
450af8d0f6be2e7 KP Singh     2020-08-25  425  		 */
450af8d0f6be2e7 KP Singh     2020-08-25  426  		err =3D -EAGAIN;
450af8d0f6be2e7 KP Singh     2020-08-25  427  		goto unlock_err;
450af8d0f6be2e7 KP Singh     2020-08-25  428  	}
450af8d0f6be2e7 KP Singh     2020-08-25  429  =

450af8d0f6be2e7 KP Singh     2020-08-25  430  	old_sdata =3D bpf_local_stor=
age_lookup(local_storage, smap, false);
450af8d0f6be2e7 KP Singh     2020-08-25  431  	err =3D check_flags(old_sdat=
a, map_flags);
450af8d0f6be2e7 KP Singh     2020-08-25  432  	if (err)
450af8d0f6be2e7 KP Singh     2020-08-25  433  		goto unlock_err;
450af8d0f6be2e7 KP Singh     2020-08-25  434  =

450af8d0f6be2e7 KP Singh     2020-08-25  435  	if (old_sdata && (map_flags =
& BPF_F_LOCK)) {
450af8d0f6be2e7 KP Singh     2020-08-25  436  		copy_map_value_locked(&smap=
->map, old_sdata->data, value,
450af8d0f6be2e7 KP Singh     2020-08-25  437  				      false);
450af8d0f6be2e7 KP Singh     2020-08-25  438  		selem =3D SELEM(old_sdata);
450af8d0f6be2e7 KP Singh     2020-08-25  439  		goto unlock;
450af8d0f6be2e7 KP Singh     2020-08-25  440  	}
450af8d0f6be2e7 KP Singh     2020-08-25  441  =

b00fa38a9c1cba0 Joanne Koong 2022-03-17  442  	if (gfp_flags !=3D GFP_KERNE=
L) {
450af8d0f6be2e7 KP Singh     2020-08-25  443  		/* local_storage->lock is h=
eld.  Hence, we are sure
450af8d0f6be2e7 KP Singh     2020-08-25  444  		 * we can unlink and unchar=
ge the old_sdata successfully
450af8d0f6be2e7 KP Singh     2020-08-25  445  		 * later.  Hence, instead o=
f charging the new selem now
450af8d0f6be2e7 KP Singh     2020-08-25  446  		 * and then uncharge the ol=
d selem later (which may cause
450af8d0f6be2e7 KP Singh     2020-08-25  447  		 * a potential but unnecess=
ary charge failure),  avoid taking
450af8d0f6be2e7 KP Singh     2020-08-25  448  		 * a charge at all here (th=
e "!old_sdata" check) and the
450af8d0f6be2e7 KP Singh     2020-08-25  449  		 * old_sdata will not be un=
charged later during
450af8d0f6be2e7 KP Singh     2020-08-25  450  		 * bpf_selem_unlink_storage=
_nolock().
450af8d0f6be2e7 KP Singh     2020-08-25  451  		 */
b00fa38a9c1cba0 Joanne Koong 2022-03-17  452  		selem =3D bpf_selem_alloc(s=
map, owner, value, !old_sdata, gfp_flags);
450af8d0f6be2e7 KP Singh     2020-08-25  453  		if (!selem) {
450af8d0f6be2e7 KP Singh     2020-08-25  454  			err =3D -ENOMEM;
450af8d0f6be2e7 KP Singh     2020-08-25  455  			goto unlock_err;
450af8d0f6be2e7 KP Singh     2020-08-25  456  		}
b00fa38a9c1cba0 Joanne Koong 2022-03-17  457  	}
450af8d0f6be2e7 KP Singh     2020-08-25  458  =

450af8d0f6be2e7 KP Singh     2020-08-25  459  	/* First, link the new selem=
 to the map */
450af8d0f6be2e7 KP Singh     2020-08-25  460  	bpf_selem_link_map(smap, sel=
em);
450af8d0f6be2e7 KP Singh     2020-08-25  461  =

450af8d0f6be2e7 KP Singh     2020-08-25  462  	/* Second, link (and publish=
) the new selem to local_storage */
450af8d0f6be2e7 KP Singh     2020-08-25  463  	bpf_selem_link_storage_noloc=
k(local_storage, selem);
450af8d0f6be2e7 KP Singh     2020-08-25  464  =

450af8d0f6be2e7 KP Singh     2020-08-25  465  	/* Third, remove old selem, =
SELEM(old_sdata) */
450af8d0f6be2e7 KP Singh     2020-08-25  466  	if (old_sdata) {
450af8d0f6be2e7 KP Singh     2020-08-25  467  		bpf_selem_unlink_map(SELEM(=
old_sdata));
450af8d0f6be2e7 KP Singh     2020-08-25  468  		bpf_selem_unlink_storage_no=
lock(local_storage, SELEM(old_sdata),
450af8d0f6be2e7 KP Singh     2020-08-25  469  						false);
450af8d0f6be2e7 KP Singh     2020-08-25  470  	}
450af8d0f6be2e7 KP Singh     2020-08-25  471  =

450af8d0f6be2e7 KP Singh     2020-08-25  472  unlock:
a10787e6d58c24b Song Liu     2021-02-25 @473  	raw_spin_unlock_irqrestore(&=
local_storage->lock, flags);
450af8d0f6be2e7 KP Singh     2020-08-25  474  	return SDATA(selem);
450af8d0f6be2e7 KP Singh     2020-08-25  475  =

450af8d0f6be2e7 KP Singh     2020-08-25  476  unlock_err:
a10787e6d58c24b Song Liu     2021-02-25  477  	raw_spin_unlock_irqrestore(&=
local_storage->lock, flags);
b00fa38a9c1cba0 Joanne Koong 2022-03-17  478  	if (selem) {
b00fa38a9c1cba0 Joanne Koong 2022-03-17  479  		mem_uncharge(smap, owner, s=
map->elem_size);
b00fa38a9c1cba0 Joanne Koong 2022-03-17  480  		kfree(selem);
b00fa38a9c1cba0 Joanne Koong 2022-03-17  481  	}
450af8d0f6be2e7 KP Singh     2020-08-25  482  	return ERR_PTR(err);
450af8d0f6be2e7 KP Singh     2020-08-25  483  }
450af8d0f6be2e7 KP Singh     2020-08-25  484  =


:::::: The code at line 473 was first introduced by commit
:::::: a10787e6d58c24b51e91c19c6d16c5da89fcaa4b bpf: Enable task local stor=
age for tracing programs

:::::: TO: Song Liu <songliubraving@fb.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2961168217868832838==--

