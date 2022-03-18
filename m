Content-Type: multipart/mixed; boundary="===============7068570422226698903=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 3/7] xfs: xfs_ail_push_all_sync() stalls when racing with updates
Date: Fri, 18 Mar 2022 18:08:23 +0800
Message-ID: <202203181702.8MiQ7z1k-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7068570422226698903==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220317053907.164160-4-david@fromorbit.com>
References: <20220317053907.164160-4-david@fromorbit.com>
TO: Dave Chinner <david@fromorbit.com>

Hi Dave,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on xfs-linux/for-next]
[also build test WARNING on v5.17-rc8 next-20220317]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Dave-Chinner/xfs-log-recov=
ery-fixes/20220317-141849
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
318/202203181702.8MiQ7z1k-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e=
3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/29e90a4845ecee7dcc9d1e1af=
7ab6bb2231cfb1a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Dave-Chinner/xfs-log-recovery-fixe=
s/20220317-141849
        git checkout 29e90a4845ecee7dcc9d1e1af7ab6bb2231cfb1a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/xfs/xfs_trans_ail.c:459:3: note: Taking false branch
                   if (lip)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/xfs/xfs_trans_ail.c:470:7: note: 'lip' is non-null
           if (!lip)
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/xfs/xfs_trans_ail.c:470:2: note: '?' condition is false
           if (!lip)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/xfs/xfs_trans_ail.c:470:7: note: 'lip' is non-null
           if (!lip)
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
   fs/xfs/xfs_trans_ail.c:470:2: note: '?' condition is false
           if (!lip)
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
   fs/xfs/xfs_trans_ail.c:470:2: note: Taking false branch
           if (!lip)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/xfs/xfs_trans_ail.c:473:2: note: Loop condition is false.  Exiting lo=
op
           XFS_STATS_INC(mp, xs_push_ail);
           ^
   fs/xfs/xfs_stats.h:165:2: note: expanded from macro 'XFS_STATS_INC'
           per_cpu_ptr(xfsstats.xs_stats, current_cpu())->s.v++;   \
           ^
   include/linux/percpu-defs.h:263:47: note: expanded from macro 'per_cpu_p=
tr'
   #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); =
})
                                                   ^
   include/linux/percpu-defs.h:259:2: note: expanded from macro 'VERIFY_PER=
CPU_PTR'
           __verify_pcpu_ptr(__p);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   fs/xfs/xfs_trans_ail.c:473:2: note: Loop condition is false.  Exiting lo=
op
           XFS_STATS_INC(mp, xs_push_ail);
           ^
   fs/xfs/xfs_stats.h:166:2: note: expanded from macro 'XFS_STATS_INC'
           per_cpu_ptr(mp->m_stats.xs_stats, current_cpu())->s.v++;        \
           ^
   include/linux/percpu-defs.h:263:47: note: expanded from macro 'per_cpu_p=
tr'
   #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); =
})
                                                   ^
   include/linux/percpu-defs.h:259:2: note: expanded from macro 'VERIFY_PER=
CPU_PTR'
           __verify_pcpu_ptr(__p);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   fs/xfs/xfs_trans_ail.c:473:2: note: Loop condition is false.  Exiting lo=
op
           XFS_STATS_INC(mp, xs_push_ail);
           ^
   fs/xfs/xfs_stats.h:163:34: note: expanded from macro 'XFS_STATS_INC'
   #define XFS_STATS_INC(mp, v)                                    \
                                                                   ^
   fs/xfs/xfs_trans_ail.c:476:10: note: 2nd function call argument is an un=
initialized value
           while ((XFS_LSN_CMP(lip->li_lsn, target) <=3D 0)) {
                   ^
   fs/xfs/xfs_log.h:91:26: note: expanded from macro 'XFS_LSN_CMP'
   #define XFS_LSN_CMP(x,y) _lsn_cmp(x,y)
                            ^          ~
>> fs/xfs/xfs_trans_ail.c:737:10: warning: Although the value stored to 'li=
p' is used in the enclosing expression, the value is never actually read fr=
om 'lip' [clang-analyzer-deadcode.DeadStores]
           while ((lip =3D xfs_ail_max(ailp)) !=3D NULL) {
                   ^     ~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_trans_ail.c:737:10: note: Although the value stored to 'lip' =
is used in the enclosing expression, the value is never actually read from =
'lip'
           while ((lip =3D xfs_ail_max(ailp)) !=3D NULL) {
                   ^     ~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   sound/drivers/opl4/opl4_mixer.c:74:2: warning: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(card->mixername, ",OPL4");
           ^~~~~~
   sound/drivers/opl4/opl4_mixer.c:74:2: note: Call to function 'strcat' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcat'. CWE-119
           strcat(card->mixername, ",OPL4");
           ^~~~~~
   2 warnings generated.
   sound/drivers/opl4/opl4_synth.c:444:18: warning: The result of the left =
shift is undefined because the left operand is negative [clang-analyzer-cor=
e.UndefinedBinaryOperatorResult]
                          (octave << 4) | ((pitch >> 7) & OPL4_F_NUMBER_HIG=
H_MASK));
                                  ^
   sound/drivers/opl4/opl4_synth.c:589:2: note: Control jumps to 'case 128:=
'  at line 618
           switch (type) {
           ^
   sound/drivers/opl4/opl4_synth.c:619:3: note: Calling 'snd_opl4_do_for_ch=
annel'
                   snd_opl4_do_for_channel(opl4, chan, snd_opl4_update_pitc=
h);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   sound/drivers/opl4/opl4_synth.c:340:2: note: Loop condition is false.  E=
xiting loop
           spin_lock_irqsave(&opl4->reg_lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   sound/drivers/opl4/opl4_synth.c:340:2: note: Loop condition is false.  E=
xiting loop
           spin_lock_irqsave(&opl4->reg_lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   sound/drivers/opl4/opl4_synth.c:341:2: note: Loop condition is true.  En=
tering loop body
           for (i =3D 0; i < OPL4_MAX_VOICES; i++) {
           ^
   sound/drivers/opl4/opl4_synth.c:343:7: note: Assuming 'chan' is equal to=
 field 'chan'
                   if (voice->chan =3D=3D chan) {
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   sound/drivers/opl4/opl4_synth.c:343:3: note: '?' condition is false
                   if (voice->chan =3D=3D chan) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   sound/drivers/opl4/opl4_synth.c:343:22: note: 'chan' is equal to field '=
chan'
                   if (voice->chan =3D=3D chan) {
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
   sound/drivers/opl4/opl4_synth.c:343:3: note: '?' condition is true
                   if (voice->chan =3D=3D chan) {
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
   sound/drivers/opl4/opl4_synth.c:343:3: note: Taking true branch
                   if (voice->chan =3D=3D chan) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   sound/drivers/opl4/opl4_synth.c:344:4: note: Calling 'snd_opl4_update_pi=
tch'
                           func(opl4, voice);
                           ^~~~~~~~~~~~~~~~~
   sound/drivers/opl4/opl4_synth.c:425:9: note: Assuming field 'drum_channe=
l' is not equal to 0
           note =3D chan->drum_channel ? 60 : voice->note;
                  ^~~~~~~~~~~~~~~~~~
   sound/drivers/opl4/opl4_synth.c:425:9: note: '?' condition is true
   sound/drivers/opl4/opl4_synth.c:432:13: note: Field 'drum_channel' is no=
t equal to 0
           if (!chan->drum_channel)
                      ^

vim +737 fs/xfs/xfs_trans_ail.c

fd074841cfe01b Dave Chinner      2011-04-08  725  =

211e4d434bd737 Christoph Hellwig 2012-04-23  726  /*
211e4d434bd737 Christoph Hellwig 2012-04-23  727   * Push out all items in =
the AIL immediately and wait until the AIL is empty.
211e4d434bd737 Christoph Hellwig 2012-04-23  728   */
211e4d434bd737 Christoph Hellwig 2012-04-23  729  void
211e4d434bd737 Christoph Hellwig 2012-04-23  730  xfs_ail_push_all_sync(
211e4d434bd737 Christoph Hellwig 2012-04-23  731  	struct xfs_ail  *ailp)
211e4d434bd737 Christoph Hellwig 2012-04-23  732  {
211e4d434bd737 Christoph Hellwig 2012-04-23  733  	struct xfs_log_item	*lip;
211e4d434bd737 Christoph Hellwig 2012-04-23  734  	DEFINE_WAIT(wait);
211e4d434bd737 Christoph Hellwig 2012-04-23  735  =

57e809561118a4 Matthew Wilcox    2018-03-07  736  	spin_lock(&ailp->ail_loc=
k);
211e4d434bd737 Christoph Hellwig 2012-04-23 @737  	while ((lip =3D xfs_ail_=
max(ailp)) !=3D NULL) {
57e809561118a4 Matthew Wilcox    2018-03-07  738  		prepare_to_wait(&ailp->=
ail_empty, &wait, TASK_UNINTERRUPTIBLE);
57e809561118a4 Matthew Wilcox    2018-03-07  739  		wake_up_process(ailp->a=
il_task);
57e809561118a4 Matthew Wilcox    2018-03-07  740  		spin_unlock(&ailp->ail_=
lock);
211e4d434bd737 Christoph Hellwig 2012-04-23  741  		schedule();
57e809561118a4 Matthew Wilcox    2018-03-07  742  		spin_lock(&ailp->ail_lo=
ck);
211e4d434bd737 Christoph Hellwig 2012-04-23  743  	}
57e809561118a4 Matthew Wilcox    2018-03-07  744  	spin_unlock(&ailp->ail_l=
ock);
211e4d434bd737 Christoph Hellwig 2012-04-23  745  =

57e809561118a4 Matthew Wilcox    2018-03-07  746  	finish_wait(&ailp->ail_e=
mpty, &wait);
211e4d434bd737 Christoph Hellwig 2012-04-23  747  }
211e4d434bd737 Christoph Hellwig 2012-04-23  748  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7068570422226698903==--

