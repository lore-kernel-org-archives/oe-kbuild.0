Content-Type: multipart/mixed; boundary="===============4482450487957588194=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pnp/pnpbios/core.c:94:2: warning: Potential leak of memory pointed to by 'buf' [clang-analyzer-unix.Malloc]
Date: Tue, 18 Jan 2022 04:37:09 +0800
Message-ID: <202201180446.gHm822Qh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4482450487957588194==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0c947b893d69231a9add855939da7c66237ab44f
commit: a52f8a59aef46b59753e583bf4b28fccb069ce64 fortify: Explicitly disabl=
e Clang support
date:   4 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 4 months ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
118/202201180446.gHm822Qh-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 244dd2=
913a43a200f5a6544d424cdc37b771028b)
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
           __mmap_lock_trace_acquire_returned(mm, false, ret =3D=3D 0);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mmap_lock.h:35:2: note: '?' condition is false
           if (tracepoint_enabled(mmap_lock_acquire_returned))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   include/linux/mmap_lock.h:35:2: note: '?' condition is false
           if (tracepoint_enabled(mmap_lock_acquire_returned))
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
   include/linux/mmap_lock.h:35:2: note: Taking false branch
           if (tracepoint_enabled(mmap_lock_acquire_returned))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   include/linux/mmap_lock.h:37:1: note: Returning without writing to 'mm->=
.mmap', which participates in a condition later
   }
   ^
   include/linux/mmap_lock.h:37:1: note: Returning without writing to 'mm->=
.mmap'
   include/linux/mmap_lock.h:127:2: note: Returning from '__mmap_lock_trace=
_acquire_returned'
           __mmap_lock_trace_acquire_returned(mm, false, ret =3D=3D 0);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/proc/task_mmu.c:860:8: note: Returning from 'mmap_read_lock_killable'
           ret =3D mmap_read_lock_killable(mm);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/proc/task_mmu.c:861:2: note: '?' condition is false
           if (ret)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/proc/task_mmu.c:861:6: note: 'ret' is 0
           if (ret)
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
   fs/proc/task_mmu.c:861:2: note: '?' condition is false
           if (ret)
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
   fs/proc/task_mmu.c:861:2: note: Taking false branch
           if (ret)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/proc/task_mmu.c:866:29: note: Assuming pointer value is null
           for (vma =3D priv->mm->mmap; vma;) {
                                      ^~~
   fs/proc/task_mmu.c:866:2: note: Loop condition is false. Execution conti=
nues on line 935
           for (vma =3D priv->mm->mmap; vma;) {
           ^
   fs/proc/task_mmu.c:935:28: note: Access to field 'vm_start' results in a=
 dereference of a null pointer (loaded from field 'mmap')
           show_vma_header_prefix(m, priv->mm->mmap->vm_start,
                                     ^         ~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   lib/glob.c:48:32: warning: Assigned value is garbage or undefined [clang=
-analyzer-core.uninitialized.Assign]
           char const *back_pat =3D NULL, *back_str =3D back_str;
                                         ^          ~~~~~~~~
   lib/glob.c:48:32: note: Assigned value is garbage or undefined
           char const *back_pat =3D NULL, *back_str =3D back_str;
                                         ^          ~~~~~~~~
   4 warnings generated.
>> drivers/pnp/pnpbios/core.c:94:2: warning: Potential leak of memory point=
ed to by 'buf' [clang-analyzer-unix.Malloc]
           if (!(buf =3D kzalloc(256, GFP_KERNEL))) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:71:4: note: expanded from macro '__trace_if_val=
ue'
                   (__if_trace.miss_hit[0]++,0);           \
                    ^
   drivers/pnp/pnpbios/core.c:145:2: note: Loop condition is true.  Enterin=
g loop body
           while (1) {
           ^
   drivers/pnp/pnpbios/core.c:153:3: note: '?' condition is false
                   if (try_to_freeze())
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/pnp/pnpbios/core.c:153:3: note: '?' condition is false
                   if (try_to_freeze())
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
   drivers/pnp/pnpbios/core.c:153:3: note: Taking false branch
                   if (try_to_freeze())
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/pnp/pnpbios/core.c:158:3: note: Control jumps to 'case 135:'  at=
 line 164
                   switch (status) {
                   ^
   drivers/pnp/pnpbios/core.c:166:4: note:  Execution continues on line 175
                           break;
                           ^
   drivers/pnp/pnpbios/core.c:175:3: note: '?' condition is false
                   if (d !=3D docked) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/pnp/pnpbios/core.c:175:7: note: 'd' is not equal to 'docked'
                   if (d !=3D docked) {
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
   drivers/pnp/pnpbios/core.c:175:3: note: '?' condition is true
                   if (d !=3D docked) {
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
   drivers/pnp/pnpbios/core.c:175:3: note: Taking true branch
                   if (d !=3D docked) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/pnp/pnpbios/core.c:176:4: note: '?' condition is false
                           if (pnp_dock_event(d, &now) =3D=3D 0) {
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/pnp/pnpbios/core.c:176:8: note: Calling 'pnp_dock_event'
                           if (pnp_dock_event(d, &now) =3D=3D 0) {
                               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
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
   sound/drivers/opl4/opl4_synth.c:432:2: note: '?' condition is false
           if (!chan->drum_channel)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   sound/drivers/opl4/opl4_synth.c:432:13: note: Field 'drum_channel' is no=
t equal to 0
           if (!chan->drum_channel)
                      ^
   sound/drivers/opl4/opl4_synth.c:432:13: note: Field 'drum_channel' is no=
t equal to 0
   sound/drivers/opl4/opl4_synth.c:432:2: note: '?' condition is false
           if (!chan->drum_channel)
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
   sound/drivers/opl4/opl4_synth.c:432:2: note: Taking false branch
           if (!chan->drum_channel)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   sound/drivers/opl4/opl4_synth.c:436:6: note: Assuming 'pitch' is < 0
           if (pitch < 0)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   sound/drivers/opl4/opl4_synth.c:436:2: note: '?' condition is false
           if (pitch < 0)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   sound/drivers/opl4/opl4_synth.c:436:6: note: 'pitch' is < 0
           if (pitch < 0)
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
   sound/drivers/opl4/opl4_synth.c:436:2: note: '?' condition is true
           if (pitch < 0)
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
   sound/drivers/opl4/opl4_synth.c:436:2: note: Taking true branch
           if (pitch < 0)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   sound/drivers/opl4/opl4_synth.c:440:2: note: The value -8 is assigned to=
 'octave'
           octave =3D pitch / 0x600 - 8;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/drivers/opl4/opl4_synth.c:444:18: note: The result of the left shi=
ft is undefined because the left operand is negative
                          (octave << 4) | ((pitch >> 7) & OPL4_F_NUMBER_HIG=
H_MASK));
                           ~~~~~~ ^
>> sound/drivers/opl4/opl4_synth.c:511:19: warning: Assigned value is garba=
ge or undefined [clang-analyzer-core.uninitialized.Assign]
                   voice[i]->sound =3D sound[i];
                                   ^ ~~~~~~~~
   sound/drivers/opl4/opl4_synth.c:492:6: note: Assuming field 'drum_channe=
l' is not equal to 0
           i =3D chan->drum_channel ? 0x80 : (chan->midi_program & 0x7f);
               ^~~~~~~~~~~~~~~~~~
   sound/drivers/opl4/opl4_synth.c:492:6: note: '?' condition is true
   sound/drivers/opl4/opl4_synth.c:494:14: note: Assuming 'i' is < field 'c=
ount'
           for (i =3D 0; i < regions->count; i++) {
                       ^~~~~~~~~~~~~~~~~~
   sound/drivers/opl4/opl4_synth.c:494:2: note: Loop condition is true.  En=
tering loop body
           for (i =3D 0; i < regions->count; i++) {
           ^
   sound/drivers/opl4/opl4_synth.c:495:7: note: Assuming 'note' is < field =
'key_min'
                   if (note >=3D regions->regions[i].key_min &&
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   sound/drivers/opl4/opl4_synth.c:495:43: note: Left side of '&&' is false
                   if (note >=3D regions->regions[i].key_min &&
                                                           ^
   sound/drivers/opl4/opl4_synth.c:495:3: note: '?' condition is false
                   if (note >=3D regions->regions[i].key_min &&
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   sound/drivers/opl4/opl4_synth.c:495:7: note: 'note' is < field 'key_min'
                   if (note >=3D regions->regions[i].key_min &&
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
   sound/drivers/opl4/opl4_synth.c:495:43: note: Left side of '&&' is false
                   if (note >=3D regions->regions[i].key_min &&
                                                           ^
   sound/drivers/opl4/opl4_synth.c:495:3: note: '?' condition is false
                   if (note >=3D regions->regions[i].key_min &&
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
   sound/drivers/opl4/opl4_synth.c:495:3: note: Taking false branch
                   if (note >=3D regions->regions[i].key_min &&
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   sound/drivers/opl4/opl4_synth.c:494:14: note: Assuming 'i' is < field 'c=
ount'
           for (i =3D 0; i < regions->count; i++) {
                       ^~~~~~~~~~~~~~~~~~
   sound/drivers/opl4/opl4_synth.c:494:2: note: Loop condition is true.  En=
tering loop body
           for (i =3D 0; i < regions->count; i++) {
           ^
   sound/drivers/opl4/opl4_synth.c:495:7: note: Assuming 'note' is < field =
'key_min'
                   if (note >=3D regions->regions[i].key_min &&
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   sound/drivers/opl4/opl4_synth.c:495:43: note: Left side of '&&' is false
                   if (note >=3D regions->regions[i].key_min &&
                                                           ^
   sound/drivers/opl4/opl4_synth.c:495:3: note: '?' condition is false
                   if (note >=3D regions->regions[i].key_min &&
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   sound/drivers/opl4/opl4_synth.c:495:7: note: 'note' is < field 'key_min'
                   if (note >=3D regions->regions[i].key_min &&
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
--
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
   fs/ntfs/mft.c:1953:2: note: Taking false branch
           if (ntfs_cluster_free(mft_ni, old_last_vcn, -1, ctx) < 0) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ntfs/mft.c:1958:6: note: Access to field 'attr' results in a derefere=
nce of a null pointer (loaded from variable 'ctx')
           a =3D ctx->attr;
               ^~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   fs/xfs/libxfs/xfs_rtbitmap.c:349:8: warning: Although the value stored t=
o 'bufp' is used in the enclosing expression, the value is never actually r=
ead from 'bufp' [clang-analyzer-deadcode.DeadStores]
                           b =3D bufp =3D bp->b_addr;
                               ^      ~~~~~~~~~~
   fs/xfs/libxfs/xfs_rtbitmap.c:349:8: note: Although the value stored to '=
bufp' is used in the enclosing expression, the value is never actually read=
 from 'bufp'
                           b =3D bufp =3D bp->b_addr;
                               ^      ~~~~~~~~~~
   fs/xfs/libxfs/xfs_rtbitmap.c:394:8: warning: Although the value stored t=
o 'bufp' is used in the enclosing expression, the value is never actually r=
ead from 'bufp' [clang-analyzer-deadcode.DeadStores]
                           b =3D bufp =3D bp->b_addr;
                               ^      ~~~~~~~~~~
   fs/xfs/libxfs/xfs_rtbitmap.c:394:8: note: Although the value stored to '=
bufp' is used in the enclosing expression, the value is never actually read=
 from 'bufp'
                           b =3D bufp =3D bp->b_addr;
                               ^      ~~~~~~~~~~
   fs/xfs/libxfs/xfs_rtbitmap.c:847:8: warning: Although the value stored t=
o 'bufp' is used in the enclosing expression, the value is never actually r=
ead from 'bufp' [clang-analyzer-deadcode.DeadStores]
                           b =3D bufp =3D bp->b_addr;
                               ^      ~~~~~~~~~~
   fs/xfs/libxfs/xfs_rtbitmap.c:847:8: note: Although the value stored to '=
bufp' is used in the enclosing expression, the value is never actually read=
 from 'bufp'
                           b =3D bufp =3D bp->b_addr;
                               ^      ~~~~~~~~~~
   fs/xfs/libxfs/xfs_rtbitmap.c:893:8: warning: Although the value stored t=
o 'bufp' is used in the enclosing expression, the value is never actually r=
ead from 'bufp' [clang-analyzer-deadcode.DeadStores]
                           b =3D bufp =3D bp->b_addr;
                               ^      ~~~~~~~~~~
   fs/xfs/libxfs/xfs_rtbitmap.c:893:8: note: Although the value stored to '=
bufp' is used in the enclosing expression, the value is never actually read=
 from 'bufp'
                           b =3D bufp =3D bp->b_addr;
                               ^      ~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/most/configfs.c:173:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(mdev_link->direction, page);
           ^~~~~~
   drivers/most/configfs.c:173:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(mdev_link->direction, page);
           ^~~~~~
   drivers/most/configfs.c:192:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(mdev_link->datatype, page);
           ^~~~~~
   drivers/most/configfs.c:192:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(mdev_link->datatype, page);
           ^~~~~~
   drivers/most/configfs.c:446:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(mdev_link->name, name);
           ^~~~~~
   drivers/most/configfs.c:446:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(mdev_link->name, name);
           ^~~~~~
   drivers/most/configfs.c:535:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(mdev_link->name, name);
           ^~~~~~
   drivers/most/configfs.c:535:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(mdev_link->name, name);
           ^~~~~~
   1 warning generated.
   sound/sound_core.c:406:9: warning: Call to function 'strcat' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                                   strcat(_name, "-");
                                   ^~~~~~
   sound/sound_core.c:406:9: note: Call to function 'strcat' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcat'. CWE-119
                                   strcat(_name, "-");
                                   ^~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> sound/isa/wavefront/wavefront_synth.c:421:14: warning: Array access (fro=
m variable 'rbuf') results in a null pointer dereference [clang-analyzer-co=
re.NullDereference]
                                           rbuf[0] =3D WF_ST_EMPTY;
                                           ~~~~    ^
   sound/isa/wavefront/wavefront_synth.c:343:2: note: '?' condition is false
           if (!wfcmd) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   sound/isa/wavefront/wavefront_synth.c:343:7: note: 'wfcmd' is non-null
           if (!wfcmd) {
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
   sound/isa/wavefront/wavefront_synth.c:343:2: note: '?' condition is false
           if (!wfcmd) {
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
   sound/isa/wavefront/wavefront_synth.c:343:2: note: Taking false branch
           if (!wfcmd) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   sound/isa/wavefront/wavefront_synth.c:354:6: note: Assuming 'cmd' is equ=
al to 130
           if (cmd =3D=3D WFC_DOWNLOAD_MULTISAMPLE) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   sound/isa/wavefront/wavefront_synth.c:354:2: note: '?' condition is false
           if (cmd =3D=3D WFC_DOWNLOAD_MULTISAMPLE) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   sound/isa/wavefront/wavefront_synth.c:354:6: note: 'cmd' is equal to 130
           if (cmd =3D=3D WFC_DOWNLOAD_MULTISAMPLE) {
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
   sound/isa/wavefront/wavefront_synth.c:354:2: note: '?' condition is true
           if (cmd =3D=3D WFC_DOWNLOAD_MULTISAMPLE) {
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
   sound/isa/wavefront/wavefront_synth.c:354:2: note: Taking true branch
           if (cmd =3D=3D WFC_DOWNLOAD_MULTISAMPLE) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   sound/isa/wavefront/wavefront_synth.c:356:3: note: Null pointer value st=
ored to 'rbuf'
                   rbuf =3D NULL;
                   ^~~~~~~~~~~
   sound/isa/wavefront/wavefront_synth.c:359:2: note: Assuming the conditio=
n is false
           DPRINT (WF_DEBUG_CMD, "0x%x [%s] (%d,%d,%d)\n",
           ^
   sound/isa/wavefront/wavefront_synth.c:118:12: note: expanded from macro =
'DPRINT'
          if ((dev->debug & (cond)) =3D=3D (cond)) { \
          ~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )

vim +/buf +94 drivers/pnp/pnpbios/core.c

^1da177e4c3f41 Linus Torvalds     2005-04-16   82  =

^1da177e4c3f41 Linus Torvalds     2005-04-16   83  /*
^1da177e4c3f41 Linus Torvalds     2005-04-16   84   * (Much of this belongs=
 in a shared routine somewhere)
^1da177e4c3f41 Linus Torvalds     2005-04-16   85   */
^1da177e4c3f41 Linus Torvalds     2005-04-16   86  static int pnp_dock_even=
t(int dock, struct pnp_docking_station_info *info)
^1da177e4c3f41 Linus Torvalds     2005-04-16   87  {
377e7a27c049d6 Greg Kroah-Hartman 2016-12-11   88  	static char const sbin_=
pnpbios[] =3D "/sbin/pnpbios";
^1da177e4c3f41 Linus Torvalds     2005-04-16   89  	char *argv[3], **envp, =
*buf, *scratch;
^1da177e4c3f41 Linus Torvalds     2005-04-16   90  	int i =3D 0, value;
^1da177e4c3f41 Linus Torvalds     2005-04-16   91  =

07d4e9af109221 Bjorn Helgaas      2007-07-26   92  	if (!(envp =3D kcalloc(=
20, sizeof(char *), GFP_KERNEL)))
^1da177e4c3f41 Linus Torvalds     2005-04-16   93  		return -ENOMEM;
cd86128088554d Robert P. J. Day   2006-12-13  @94  	if (!(buf =3D kzalloc(2=
56, GFP_KERNEL))) {
^1da177e4c3f41 Linus Torvalds     2005-04-16   95  		kfree(envp);
^1da177e4c3f41 Linus Torvalds     2005-04-16   96  		return -ENOMEM;
^1da177e4c3f41 Linus Torvalds     2005-04-16   97  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16   98  =

07d4e9af109221 Bjorn Helgaas      2007-07-26   99  	/* FIXME: if there are =
actual users of this, it should be
07d4e9af109221 Bjorn Helgaas      2007-07-26  100  	 * integrated into the =
driver core and use the usual infrastructure
07d4e9af109221 Bjorn Helgaas      2007-07-26  101  	 * like sysfs and ueven=
ts
07d4e9af109221 Bjorn Helgaas      2007-07-26  102  	 */
377e7a27c049d6 Greg Kroah-Hartman 2016-12-11  103  	argv[0] =3D (char *)sbi=
n_pnpbios;
^1da177e4c3f41 Linus Torvalds     2005-04-16  104  	argv[1] =3D "dock";
^1da177e4c3f41 Linus Torvalds     2005-04-16  105  	argv[2] =3D NULL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  106  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  107  	/* minimal command envi=
ronment */
^1da177e4c3f41 Linus Torvalds     2005-04-16  108  	envp[i++] =3D "HOME=3D/=
";
^1da177e4c3f41 Linus Torvalds     2005-04-16  109  	envp[i++] =3D "PATH=3D/=
sbin:/bin:/usr/sbin:/usr/bin";
^1da177e4c3f41 Linus Torvalds     2005-04-16  110  =


:::::: The code at line 94 was first introduced by commit
:::::: cd86128088554d64fea1679191509f00e6353c5b [PATCH] Fix numerous kcallo=
c() calls, convert to kzalloc()

:::::: TO: Robert P. J. Day <rpjday@mindspring.com>
:::::: CC: Linus Torvalds <torvalds@woody.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4482450487957588194==--

