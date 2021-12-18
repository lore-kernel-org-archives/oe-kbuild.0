Content-Type: multipart/mixed; boundary="===============2951362879186966135=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [peterz-queue:locking/wip.refcount 8/10] net/ipv6/ip6_fib.c:600:12: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Sat, 18 Dec 2021 13:04:02 +0800
Message-ID: <202112181204.O1cBkKJV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2951362879186966135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git lo=
cking/wip.refcount
head:   0d86f65b8c2fa3b47ada92eb311ca8427a7b48a0
commit: e48a4c171476683caf6210eaf6a06a7e4cbc29d9 [8/10] atomic,x86: Alterna=
tive atomic_*_overflow() scheme
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-c007-20211216 (https://download.01.org/0day-ci/ar=
chive/20211218/202112181204.O1cBkKJV-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245b=
ab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/=
commit/?id=3De48a4c171476683caf6210eaf6a06a7e4cbc29d9
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/ke=
rnel/git/peterz/queue.git
        git fetch --no-tags peterz-queue locking/wip.refcount
        git checkout e48a4c171476683caf6210eaf6a06a7e4cbc29d9
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/cifs/misc.c:110:2: note: '?' condition is false
           if (!ret_buf)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/cifs/misc.c:110:7: note: 'ret_buf' is non-null
           if (!ret_buf)
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
   fs/cifs/misc.c:110:7: note: 'ret_buf' is non-null
           if (!ret_buf)
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
   fs/cifs/misc.c:110:2: note: '?' condition is false
           if (!ret_buf)
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
   fs/cifs/misc.c:110:2: note: Taking false branch
           if (!ret_buf)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/cifs/misc.c:113:6: note: Assuming field 'fid' is non-null
           if (!ret_buf->crfid.fid) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/cifs/misc.c:113:2: note: '?' condition is false
           if (!ret_buf->crfid.fid) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/cifs/misc.c:113:22: note: Field 'fid' is non-null
           if (!ret_buf->crfid.fid) {
                               ^
   fs/cifs/misc.c:113:22: note: Field 'fid' is non-null
   fs/cifs/misc.c:113:2: note: '?' condition is false
           if (!ret_buf->crfid.fid) {
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
   fs/cifs/misc.c:113:2: note: Taking false branch
           if (!ret_buf->crfid.fid) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/cifs/misc.c:120:2: note: The expression is an uninitialized value. Th=
e computed value will also be garbage
           ++ret_buf->tc_count;
           ^ ~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> net/ipv6/ip6_fib.c:600:12: warning: Assigned value is garbage or undefin=
ed [clang-analyzer-core.uninitialized.Assign]
                           w->skip =3D w->count;
                                   ^
   net/ipv6/ip6_fib.c:630:2: note: Assuming field 'strict_check' is true
           if (cb->strict_check) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/ipv6/ip6_fib.c:630:2: note: '?' condition is false
           if (cb->strict_check) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/ipv6/ip6_fib.c:630:10: note: Field 'strict_check' is true
           if (cb->strict_check) {
                   ^
   net/ipv6/ip6_fib.c:630:2: note: '?' condition is true
           if (cb->strict_check) {
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
   net/ipv6/ip6_fib.c:630:2: note: Taking true branch
           if (cb->strict_check) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/ipv6/ip6_fib.c:634:7: note: Assuming 'err' is >=3D 0
                   if (err < 0)
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/ipv6/ip6_fib.c:634:3: note: '?' condition is false
                   if (err < 0)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/ipv6/ip6_fib.c:634:7: note: 'err' is >=3D 0
                   if (err < 0)
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
   net/ipv6/ip6_fib.c:634:3: note: '?' condition is false
                   if (err < 0)
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
   net/ipv6/ip6_fib.c:634:3: note: Taking false branch
                   if (err < 0)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/ipv6/ip6_fib.c:644:6: note: Assuming 'w' is null
           if (!w) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/ipv6/ip6_fib.c:644:2: note: '?' condition is false
           if (!w) {

vim +600 net/ipv6/ip6_fib.c

1b43af5480c351 Patrick McHardy      2006-08-10  571  =

1b43af5480c351 Patrick McHardy      2006-08-10  572  static int fib6_dump_t=
able(struct fib6_table *table, struct sk_buff *skb,
1b43af5480c351 Patrick McHardy      2006-08-10  573  			   struct netlink_c=
allback *cb)
1b43af5480c351 Patrick McHardy      2006-08-10  574  {
9a03cd8f38efb8 Michal Kube=C4=8Dek       2016-03-08  575  	struct net *net =
=3D sock_net(skb->sk);
94b2cfe02bfe3f Hannes Frederic Sowa 2014-10-06  576  	struct fib6_walker *w;
1b43af5480c351 Patrick McHardy      2006-08-10  577  	int res;
1b43af5480c351 Patrick McHardy      2006-08-10  578  =

1b43af5480c351 Patrick McHardy      2006-08-10  579  	w =3D (void *)cb->arg=
s[2];
1b43af5480c351 Patrick McHardy      2006-08-10  580  	w->root =3D &table->t=
b6_root;
1b43af5480c351 Patrick McHardy      2006-08-10  581  =

1b43af5480c351 Patrick McHardy      2006-08-10  582  	if (cb->args[4] =3D=
=3D 0) {
2bec5a369ee795 Patrick McHardy      2010-02-08  583  		w->count =3D 0;
2bec5a369ee795 Patrick McHardy      2010-02-08  584  		w->skip =3D 0;
1e47b4837f3bda Stefano Brivio       2019-06-21  585  		w->skip_in_node =3D =
0;
2bec5a369ee795 Patrick McHardy      2010-02-08  586  =

66f5d6ce53e665 Wei Wang             2017-10-06  587  		spin_lock_bh(&table-=
>tb6_lock);
9a03cd8f38efb8 Michal Kube=C4=8Dek       2016-03-08  588  		res =3D fib6_wa=
lk(net, w);
66f5d6ce53e665 Wei Wang             2017-10-06  589  		spin_unlock_bh(&tabl=
e->tb6_lock);
2bec5a369ee795 Patrick McHardy      2010-02-08  590  		if (res > 0) {
1b43af5480c351 Patrick McHardy      2006-08-10  591  			cb->args[4] =3D 1;
2bec5a369ee795 Patrick McHardy      2010-02-08  592  			cb->args[5] =3D w->=
root->fn_sernum;
2bec5a369ee795 Patrick McHardy      2010-02-08  593  		}
1b43af5480c351 Patrick McHardy      2006-08-10  594  	} else {
2bec5a369ee795 Patrick McHardy      2010-02-08  595  		if (cb->args[5] !=3D=
 w->root->fn_sernum) {
2bec5a369ee795 Patrick McHardy      2010-02-08  596  			/* Begin at the roo=
t if the tree changed */
2bec5a369ee795 Patrick McHardy      2010-02-08  597  			cb->args[5] =3D w->=
root->fn_sernum;
2bec5a369ee795 Patrick McHardy      2010-02-08  598  			w->state =3D FWS_IN=
IT;
2bec5a369ee795 Patrick McHardy      2010-02-08  599  			w->node =3D w->root;
2bec5a369ee795 Patrick McHardy      2010-02-08 @600  			w->skip =3D w->coun=
t;
1e47b4837f3bda Stefano Brivio       2019-06-21  601  			w->skip_in_node =3D=
 0;
2bec5a369ee795 Patrick McHardy      2010-02-08  602  		} else
2bec5a369ee795 Patrick McHardy      2010-02-08  603  			w->skip =3D 0;
2bec5a369ee795 Patrick McHardy      2010-02-08  604  =

66f5d6ce53e665 Wei Wang             2017-10-06  605  		spin_lock_bh(&table-=
>tb6_lock);
1b43af5480c351 Patrick McHardy      2006-08-10  606  		res =3D fib6_walk_co=
ntinue(w);
66f5d6ce53e665 Wei Wang             2017-10-06  607  		spin_unlock_bh(&tabl=
e->tb6_lock);
7891cc818967e1 Herbert Xu           2009-01-13  608  		if (res <=3D 0) {
9a03cd8f38efb8 Michal Kube=C4=8Dek       2016-03-08  609  			fib6_walker_un=
link(net, w);
1b43af5480c351 Patrick McHardy      2006-08-10  610  			cb->args[4] =3D 0;
1b43af5480c351 Patrick McHardy      2006-08-10  611  		}
7891cc818967e1 Herbert Xu           2009-01-13  612  	}
7891cc818967e1 Herbert Xu           2009-01-13  613  =

1b43af5480c351 Patrick McHardy      2006-08-10  614  	return res;
1b43af5480c351 Patrick McHardy      2006-08-10  615  }
1b43af5480c351 Patrick McHardy      2006-08-10  616  =


:::::: The code at line 600 was first introduced by commit
:::::: 2bec5a369ee79576a3eea2c23863325089785a2c ipv6: fib: fix crash when c=
hanging large fib while dumping it

:::::: TO: Patrick McHardy <kaber@trash.net>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2951362879186966135==--

