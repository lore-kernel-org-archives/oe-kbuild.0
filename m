Content-Type: multipart/mixed; boundary="===============0231657264746488198=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/2] ASoC: soc-pcm: Move debugfs removal out of spinlock
Date: Fri, 21 Jan 2022 10:27:57 +0800
Message-ID: <202201211023.fsBclrza-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0231657264746488198==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220119155249.26754-3-tiwai@suse.de>
References: <20220119155249.26754-3-tiwai@suse.de>
TO: Takashi Iwai <tiwai@suse.de>
TO: Mark Brown <broonie@kernel.org>
CC: Hans de Goede <hdegoede@redhat.com>
CC: alsa-devel(a)alsa-project.org
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>
CC: Marek Szyprowski <m.szyprowski@samsung.com>

Hi Takashi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on tiwai-sound/for-next linus/master next-20220120]
[cannot apply to v5.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Takashi-Iwai/ASoC-DPCM-loc=
kdep-fixes/20220119-235642
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git f=
or-next
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
121/202201211023.fsBclrza-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f7b713=
8a62648f4019c55e4671682af1f851f295)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/f3a7ec4e49838fc98c7f0d2fd=
6c844b44216d1d4
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Takashi-Iwai/ASoC-DPCM-lockdep-fix=
es/20220119-235642
        git checkout f3a7ec4e49838fc98c7f0d2fd6c844b44216d1d4
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:133:2: note: expanded from macro '__dynami=
c_func_call'
           if (DYNAMIC_DEBUG_BRANCH(id))                   \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   sound/soc/soc-pcm.c:1284:3: note: '?' condition is false
                   dev_dbg(fe->dev, "freed DSP %s path %s %s %s\n",
                   ^
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
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
   sound/soc/soc-pcm.c:1284:3: note: Taking false branch
                   dev_dbg(fe->dev, "freed DSP %s path %s %s %s\n",
                   ^
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:133:2: note: expanded from macro '__dynami=
c_func_call'
           if (DYNAMIC_DEBUG_BRANCH(id))                   \
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   sound/soc/soc-pcm.c:1284:3: note: Loop condition is false.  Exiting loop
                   dev_dbg(fe->dev, "freed DSP %s path %s %s %s\n",
                   ^
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:131:49: note: expanded from macro '__dynam=
ic_func_call'
   #define __dynamic_func_call(id, fmt, func, ...) do {    \
                                                   ^
   sound/soc/soc-pcm.c:1276:2: note: Loop condition is false. Execution con=
tinues on line 1294
           for_each_dpcm_be_safe(fe, stream, dpcm, d) {
           ^
   include/sound/soc-dpcm.h:114:2: note: expanded from macro 'for_each_dpcm=
_be_safe'
           list_for_each_entry_safe(_dpcm, __dpcm, &(fe)->dpcm[stream].be_c=
lients, list_be)
           ^
   include/linux/list.h:717:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   sound/soc/soc-pcm.c:1296:9: note: Assuming the condition is true
           while (!list_empty(&deleted_dpcms)) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1296:2: note: Loop condition is true.  Entering loop=
 body
           while (!list_empty(&deleted_dpcms)) {
           ^
   sound/soc/soc-pcm.c:1301:3: note: Memory is released
                   kfree(dpcm);
                   ^~~~~~~~~~~
   sound/soc/soc-pcm.c:1296:9: note: Assuming the condition is true
           while (!list_empty(&deleted_dpcms)) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1296:2: note: Loop condition is true.  Entering loop=
 body
           while (!list_empty(&deleted_dpcms)) {
           ^
   sound/soc/soc-pcm.c:1299:3: note: Calling 'list_del'
                   list_del(&dpcm->list_fe);
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:149:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
>> sound/soc/soc-pcm.c:1301:3: warning: Argument to kfree() is the address =
of the local variable 'deleted_dpcms', which is not memory allocated by mal=
loc() [clang-analyzer-unix.Malloc]
                   kfree(dpcm);
                   ^     ~~~~
   sound/soc/soc-pcm.c:1273:2: note: Assuming 'debug_locks' is not equal to=
 0
           snd_soc_dpcm_mutex_assert_held(fe);
           ^
   sound/soc/soc-pcm.c:41:2: note: expanded from macro 'snd_soc_dpcm_mutex_=
assert_held'
           lockdep_assert_held(&(rtd)->card->pcm_mutex)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:310:15: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                        ^~~~~~~~~~~
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   sound/soc/soc-pcm.c:1273:2: note: Left side of '&&' is true
           snd_soc_dpcm_mutex_assert_held(fe);
           ^
   sound/soc/soc-pcm.c:41:2: note: expanded from macro 'snd_soc_dpcm_mutex_=
assert_held'
           lockdep_assert_held(&(rtd)->card->pcm_mutex)
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:15: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                        ^
   sound/soc/soc-pcm.c:1273:2: note: Assuming the condition is true
           snd_soc_dpcm_mutex_assert_held(fe);
           ^
   sound/soc/soc-pcm.c:41:2: note: expanded from macro 'snd_soc_dpcm_mutex_=
assert_held'
           lockdep_assert_held(&(rtd)->card->pcm_mutex)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:316:17: note: expanded from macro 'lockdep_asser=
t_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:286:32: note: expanded from macro 'lockdep_is_he=
ld'
   #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
                                           ^
   include/linux/lockdep.h:310:32: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   sound/soc/soc-pcm.c:1273:2: note: '?' condition is false
           snd_soc_dpcm_mutex_assert_held(fe);
           ^
   sound/soc/soc-pcm.c:41:2: note: expanded from macro 'snd_soc_dpcm_mutex_=
assert_held'
           lockdep_assert_held(&(rtd)->card->pcm_mutex)
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:7: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   sound/soc/soc-pcm.c:1273:2: note: '?' condition is false
           snd_soc_dpcm_mutex_assert_held(fe);
           ^
   sound/soc/soc-pcm.c:41:2: note: expanded from macro 'snd_soc_dpcm_mutex_=
assert_held'
           lockdep_assert_held(&(rtd)->card->pcm_mutex)
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:7: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
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
   sound/soc/soc-pcm.c:1273:2: note: Taking false branch
           snd_soc_dpcm_mutex_assert_held(fe);
           ^
   sound/soc/soc-pcm.c:41:2: note: expanded from macro 'snd_soc_dpcm_mutex_=
assert_held'
           lockdep_assert_held(&(rtd)->card->pcm_mutex)
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:7: note: expanded from macro 'lockdep_assert'

vim +/deleted_dpcms +1301 sound/soc/soc-pcm.c

01d7584cd2e5a9 Liam Girdwood     2012-04-25  1266  =

01d7584cd2e5a9 Liam Girdwood     2012-04-25  1267  /* disconnect a BE and F=
E */
23607025303af6 Liam Girdwood     2014-01-17  1268  void dpcm_be_disconnect(=
struct snd_soc_pcm_runtime *fe, int stream)
01d7584cd2e5a9 Liam Girdwood     2012-04-25  1269  {
01d7584cd2e5a9 Liam Girdwood     2012-04-25  1270  	struct snd_soc_dpcm *dp=
cm, *d;
f3a7ec4e49838f Takashi Iwai      2022-01-19  1271  	LIST_HEAD(deleted_dpcms=
);
01d7584cd2e5a9 Liam Girdwood     2012-04-25  1272  =

b7898396f4bbe1 Takashi Iwai      2021-12-07  1273  	snd_soc_dpcm_mutex_asse=
rt_held(fe);
b7898396f4bbe1 Takashi Iwai      2021-12-07  1274  =

b7898396f4bbe1 Takashi Iwai      2021-12-07  1275  	snd_soc_dpcm_stream_loc=
k_irq(fe, stream);
8d6258a4dd2678 Kuninori Morimoto 2018-09-18  1276  	for_each_dpcm_be_safe(f=
e, stream, dpcm, d) {
103d84a3cbe1e7 Liam Girdwood     2012-11-19  1277  		dev_dbg(fe->dev, "ASoC=
: BE %s disconnect check for %s\n",
01d7584cd2e5a9 Liam Girdwood     2012-04-25  1278  				stream ? "capture" :=
 "playback",
01d7584cd2e5a9 Liam Girdwood     2012-04-25  1279  				dpcm->be->dai_link->=
name);
01d7584cd2e5a9 Liam Girdwood     2012-04-25  1280  =

01d7584cd2e5a9 Liam Girdwood     2012-04-25  1281  		if (dpcm->state !=3D S=
ND_SOC_DPCM_LINK_STATE_FREE)
01d7584cd2e5a9 Liam Girdwood     2012-04-25  1282  			continue;
01d7584cd2e5a9 Liam Girdwood     2012-04-25  1283  =

01d7584cd2e5a9 Liam Girdwood     2012-04-25  1284  		dev_dbg(fe->dev, "free=
d DSP %s path %s %s %s\n",
01d7584cd2e5a9 Liam Girdwood     2012-04-25  1285  			stream ? "capture" : =
"playback", fe->dai_link->name,
01d7584cd2e5a9 Liam Girdwood     2012-04-25  1286  			stream ? "<-" : "->",=
 dpcm->be->dai_link->name);
01d7584cd2e5a9 Liam Girdwood     2012-04-25  1287  =

01d7584cd2e5a9 Liam Girdwood     2012-04-25  1288  		/* BEs still alive nee=
d new FE */
01d7584cd2e5a9 Liam Girdwood     2012-04-25  1289  		dpcm_be_reparent(fe, d=
pcm->be, stream);
01d7584cd2e5a9 Liam Girdwood     2012-04-25  1290  =

01d7584cd2e5a9 Liam Girdwood     2012-04-25  1291  		list_del(&dpcm->list_b=
e);
f3a7ec4e49838f Takashi Iwai      2022-01-19  1292  		list_move(&dpcm->list_=
fe, &deleted_dpcms);
f3a7ec4e49838f Takashi Iwai      2022-01-19  1293  	}
f3a7ec4e49838f Takashi Iwai      2022-01-19  1294  	snd_soc_dpcm_stream_unl=
ock_irq(fe, stream);
f3a7ec4e49838f Takashi Iwai      2022-01-19  1295  =

f3a7ec4e49838f Takashi Iwai      2022-01-19  1296  	while (!list_empty(&del=
eted_dpcms)) {
f3a7ec4e49838f Takashi Iwai      2022-01-19  1297  		dpcm =3D list_first_en=
try(&deleted_dpcms, struct snd_soc_dpcm,
f3a7ec4e49838f Takashi Iwai      2022-01-19  1298  					list_fe);
01d7584cd2e5a9 Liam Girdwood     2012-04-25  1299  		list_del(&dpcm->list_f=
e);
f3a7ec4e49838f Takashi Iwai      2022-01-19  1300  		dpcm_remove_debugfs_st=
ate(dpcm);
01d7584cd2e5a9 Liam Girdwood     2012-04-25 @1301  		kfree(dpcm);
01d7584cd2e5a9 Liam Girdwood     2012-04-25  1302  	}
01d7584cd2e5a9 Liam Girdwood     2012-04-25  1303  }
01d7584cd2e5a9 Liam Girdwood     2012-04-25  1304  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0231657264746488198==--

