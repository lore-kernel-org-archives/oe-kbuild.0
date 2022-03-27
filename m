Content-Type: multipart/mixed; boundary="===============5259506423476892683=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [plbossart-sound:fix/hda-dai-suspend-rebase 17/17] sound/soc/soc-pcm.c:2126:5: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 27 Mar 2022 18:39:44 +0800
Message-ID: <202203271840.AHZcuHQv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5259506423476892683==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>

tree:   https://github.com/plbossart/sound fix/hda-dai-suspend-rebase
head:   596c69339cbe8dcca6d0631e06ceb711373ea25a
commit: 596c69339cbe8dcca6d0631e06ceb711373ea25a [17/17] ASoC: soc-pcm: imp=
rove BE transition for TRIGGER_START
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20327/202203271840.AHZcuHQv-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/plbossart/sound/commit/596c69339cbe8dcca6d0631=
e06ceb711373ea25a
        git remote add plbossart-sound https://github.com/plbossart/sound
        git fetch --no-tags plbossart-sound fix/hda-dai-suspend-rebase
        git checkout 596c69339cbe8dcca6d0631e06ceb711373ea25a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   sound/soc/soc-pcm.c:1273:2: note: Left side of '&&' is false
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
   include/linux/lockdep.h:310:27: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
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
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   sound/soc/soc-pcm.c:1273:2: note: Loop condition is false.  Exiting loop
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
   include/linux/lockdep.h:310:2: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
           ^
   sound/soc/soc-pcm.c:1276:2: note: Loop condition is true.  Entering loop=
 body
           for_each_dpcm_be_safe(fe, stream, dpcm, d) {
           ^
   include/sound/soc-dpcm.h:116:2: note: expanded from macro 'for_each_dpcm=
_be_safe'
           list_for_each_entry_safe(_dpcm, __dpcm, &(fe)->dpcm[stream].be_c=
lients, list_be)
           ^
   include/linux/list.h:725:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   sound/soc/soc-pcm.c:1277:3: note: Taking false branch
                   dev_dbg(fe->dev, "ASoC: BE %s disconnect check for %s\n",
                   ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   sound/soc/soc-pcm.c:1281:7: note: Assuming field 'state' is equal to SND=
_SOC_DPCM_LINK_STATE_FREE
                   if (dpcm->state !=3D SND_SOC_DPCM_LINK_STATE_FREE)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:1281:3: note: Taking false branch
                   if (dpcm->state !=3D SND_SOC_DPCM_LINK_STATE_FREE)
                   ^
   sound/soc/soc-pcm.c:1284:3: note: Taking false branch
                   dev_dbg(fe->dev, "freed DSP %s path %s %s %s\n",
                   ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   sound/soc/soc-pcm.c:1276:2: note: Loop condition is false. Execution con=
tinues on line 1294
           for_each_dpcm_be_safe(fe, stream, dpcm, d) {
           ^
   include/sound/soc-dpcm.h:116:2: note: expanded from macro 'for_each_dpcm=
_be_safe'
           list_for_each_entry_safe(_dpcm, __dpcm, &(fe)->dpcm[stream].be_c=
lients, list_be)
           ^
   include/linux/list.h:725:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   sound/soc/soc-pcm.c:1296:2: note: Loop condition is true.  Entering loop=
 body
           while (!list_empty(&deleted_dpcms)) {
           ^
   sound/soc/soc-pcm.c:1301:3: note: Memory is released
                   kfree(dpcm);
                   ^~~~~~~~~~~
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
>> sound/soc/soc-pcm.c:2126:5: warning: Value stored to 'ret' is never read=
 [clang-analyzer-deadcode.DeadStores]
                                   ret =3D soc_pcm_trigger(be_substream,
                                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:2126:5: note: Value stored to 'ret' is never read
                                   ret =3D soc_pcm_trigger(be_substream,
                                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:2129:5: warning: Value stored to 'ret' is never read=
 [clang-analyzer-deadcode.DeadStores]
                                   ret =3D soc_pcm_trigger(be_substream,
                                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-pcm.c:2129:5: note: Value stored to 'ret' is never read
                                   ret =3D soc_pcm_trigger(be_substream,
                                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   net/sched/sch_fq.c:321:28: warning: Dereference of null pointer [clang-a=
nalyzer-core.NullDereference]
                                        f->socket_hash !=3D sk->sk_hash)) {
                                                          ^
   net/sched/sch_fq.c:448:15: note: Assuming field 'qlen' is < field 'limit'
           if (unlikely(sch->q.qlen >=3D sch->limit))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/sched/sch_fq.c:448:2: note: Taking false branch
           if (unlikely(sch->q.qlen >=3D sch->limit))
           ^
   net/sched/sch_fq.c:451:6: note: Assuming field 'tstamp' is 0
           if (!skb->tstamp) {
               ^~~~~~~~~~~~
   net/sched/sch_fq.c:451:2: note: Taking true branch
           if (!skb->tstamp) {
           ^
   net/sched/sch_fq.c:473:6: note: Calling 'fq_classify'
           f =3D fq_classify(skb, q);
               ^~~~~~~~~~~~~~~~~~~
   net/sched/sch_fq.c:269:15: note: Assuming the condition is false
           if (unlikely((skb->priority & TC_PRIO_MAX) =3D=3D TC_PRIO_CONTRO=
L))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/sched/sch_fq.c:269:2: note: Taking false branch
           if (unlikely((skb->priority & TC_PRIO_MAX) =3D=3D TC_PRIO_CONTRO=
L))
           ^
   net/sched/sch_fq.c:281:6: note: Assuming 'sk' is null
           if (!sk || sk_listener(sk)) {
               ^~~
   net/sched/sch_fq.c:281:10: note: Left side of '||' is true
           if (!sk || sk_listener(sk)) {
                   ^
   net/sched/sch_fq.c:287:3: note: Value assigned to 'sk'
                   sk =3D (struct sock *)((hash << 1) | 1UL);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_fq.c:304:6: note: Assuming the condition is false
           if (q->flows >=3D (2U << q->fq_trees_log) &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_fq.c:304:42: note: Left side of '&&' is false
           if (q->flows >=3D (2U << q->fq_trees_log) &&
                                                   ^
   net/sched/sch_fq.c:310:2: note: Loop condition is true.  Entering loop b=
ody
           while (*p) {
           ^
   net/sched/sch_fq.c:314:7: note: Assuming 'sk' is equal to field 'sk'
                   if (f->sk =3D=3D sk) {
                       ^~~~~~~~~~~
   net/sched/sch_fq.c:314:3: note: Taking true branch
                   if (f->sk =3D=3D sk) {
                   ^
   net/sched/sch_fq.c:320:17: note: Assuming 'sk' is equal to field 'sk'
                           if (unlikely(skb->sk =3D=3D sk &&
                                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/sched/sch_fq.c:320:17: note: Left side of '&&' is true
                           if (unlikely(skb->sk =3D=3D sk &&
                                        ^
   net/sched/sch_fq.c:321:28: note: Dereference of null pointer
                                        f->socket_hash !=3D sk->sk_hash)) {
                                                          ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/sched/sch_fq.c:349:20: warning: Dereference of null pointer [clang-a=
nalyzer-core.NullDereference]
                   f->socket_hash =3D sk->sk_hash;
                                    ^
   net/sched/sch_fq.c:448:15: note: Assuming field 'qlen' is < field 'limit'
           if (unlikely(sch->q.qlen >=3D sch->limit))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/sched/sch_fq.c:448:2: note: Taking false branch
           if (unlikely(sch->q.qlen >=3D sch->limit))
           ^
   net/sched/sch_fq.c:451:6: note: Assuming field 'tstamp' is 0
           if (!skb->tstamp) {
               ^~~~~~~~~~~~
   net/sched/sch_fq.c:451:2: note: Taking true branch
           if (!skb->tstamp) {

vim +/ret +2126 sound/soc/soc-pcm.c

01d7584cd2e5a9 Liam Girdwood        2012-04-25  2088  =

23607025303af6 Liam Girdwood        2014-01-17  2089  int dpcm_be_dai_trigg=
er(struct snd_soc_pcm_runtime *fe, int stream,
45c0a188ca59e7 Mark Brown           2012-05-09  2090  			       int cmd)
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2091  {
db3aa39c910684 Kuninori Morimoto    2021-03-15  2092  	struct snd_soc_pcm_r=
untime *be;
5b3ffa2283999b Pierre-Louis Bossart 2022-03-21  2093  	bool pause_stop_tran=
sition;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2094  	struct snd_soc_dpcm =
*dpcm;
b2ae80663008a7 Takashi Iwai         2021-12-07  2095  	unsigned long flags;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2096  	int ret =3D 0;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2097  =

8d6258a4dd2678 Kuninori Morimoto    2018-09-18  2098  	for_each_dpcm_be(fe,=
 stream, dpcm) {
db3aa39c910684 Kuninori Morimoto    2021-03-15  2099  		struct snd_pcm_subs=
tream *be_substream;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2100  =

db3aa39c910684 Kuninori Morimoto    2021-03-15  2101  		be =3D dpcm->be;
db3aa39c910684 Kuninori Morimoto    2021-03-15  2102  		be_substream =3D sn=
d_soc_dpcm_get_substream(be, stream);
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2103  =

3c75c0ea5da749 Takashi Iwai         2022-01-19  2104  		snd_soc_dpcm_stream=
_lock_irqsave_nested(be, stream, flags);
b2ae80663008a7 Takashi Iwai         2021-12-07  2105  =

01d7584cd2e5a9 Liam Girdwood        2012-04-25  2106  		/* is this op for t=
his BE ? */
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2107  		if (!snd_soc_dpcm_b=
e_can_update(fe, be, stream))
b2ae80663008a7 Takashi Iwai         2021-12-07  2108  			goto next;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2109  =

a9faca15a644ff Kuninori Morimoto    2020-12-01  2110  		dev_dbg(be->dev, "A=
SoC: trigger BE %s cmd %d\n",
a9faca15a644ff Kuninori Morimoto    2020-12-01  2111  			be->dai_link->name=
, cmd);
a9faca15a644ff Kuninori Morimoto    2020-12-01  2112  =

01d7584cd2e5a9 Liam Girdwood        2012-04-25  2113  		switch (cmd) {
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2114  		case SNDRV_PCM_TRIG=
GER_START:
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2115  			if (!be->dpcm[stre=
am].be_start &&
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2116  			    (be->dpcm[stre=
am].state !=3D SND_SOC_DPCM_STATE_PREPARE) &&
21fca8bdbb64df =EC=9D=B4=EA=B2=BD=ED=83=9D               2020-04-01  2117  =
			    (be->dpcm[stream].state !=3D SND_SOC_DPCM_STATE_STOP) &&
3202e2f5fac003 Mark Brown           2021-08-30  2118  			    (be->dpcm[stre=
am].state !=3D SND_SOC_DPCM_STATE_PAUSED))
b2ae80663008a7 Takashi Iwai         2021-12-07  2119  				goto next;
6479f7588651cb Pierre-Louis Bossart 2021-08-17  2120  =

848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2121  			be->dpcm[stream].b=
e_start++;
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2122  			if (be->dpcm[strea=
m].be_start !=3D 1)
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2123  				goto next;
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2124  =

596c69339cbe8d Pierre-Louis Bossart 2022-03-22  2125  			if (be->dpcm[strea=
m].state =3D=3D SND_SOC_DPCM_STATE_PAUSED)
596c69339cbe8d Pierre-Louis Bossart 2022-03-22 @2126  				ret =3D soc_pcm_t=
rigger(be_substream,
596c69339cbe8d Pierre-Louis Bossart 2022-03-22  2127  						      SNDRV_PCM=
_TRIGGER_PAUSE_RELEASE);
596c69339cbe8d Pierre-Louis Bossart 2022-03-22  2128  			else
596c69339cbe8d Pierre-Louis Bossart 2022-03-22  2129  				ret =3D soc_pcm_t=
rigger(be_substream,
596c69339cbe8d Pierre-Louis Bossart 2022-03-22  2130  						      SNDRV_PCM=
_TRIGGER_START);
596c69339cbe8d Pierre-Louis Bossart 2022-03-22  2131  =

a9faca15a644ff Kuninori Morimoto    2020-12-01  2132  			ret =3D soc_pcm_tr=
igger(be_substream, cmd);
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2133  			if (ret) {
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2134  				be->dpcm[stream].=
be_start--;
b2ae80663008a7 Takashi Iwai         2021-12-07  2135  				goto next;
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2136  			}
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2137  =

3202e2f5fac003 Mark Brown           2021-08-30  2138  			be->dpcm[stream].s=
tate =3D SND_SOC_DPCM_STATE_START;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2139  			break;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2140  		case SNDRV_PCM_TRIG=
GER_RESUME:
3202e2f5fac003 Mark Brown           2021-08-30  2141  			if ((be->dpcm[stre=
am].state !=3D SND_SOC_DPCM_STATE_SUSPEND))
b2ae80663008a7 Takashi Iwai         2021-12-07  2142  				goto next;
6479f7588651cb Pierre-Louis Bossart 2021-08-17  2143  =

848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2144  			be->dpcm[stream].b=
e_start++;
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2145  			if (be->dpcm[strea=
m].be_start !=3D 1)
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2146  				goto next;
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2147  =

a9faca15a644ff Kuninori Morimoto    2020-12-01  2148  			ret =3D soc_pcm_tr=
igger(be_substream, cmd);
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2149  			if (ret) {
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2150  				be->dpcm[stream].=
be_start--;
b2ae80663008a7 Takashi Iwai         2021-12-07  2151  				goto next;
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2152  			}
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2153  =

3202e2f5fac003 Mark Brown           2021-08-30  2154  			be->dpcm[stream].s=
tate =3D SND_SOC_DPCM_STATE_START;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2155  			break;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2156  		case SNDRV_PCM_TRIG=
GER_PAUSE_RELEASE:
3aa1e96a2b95e2 Pierre-Louis Bossart 2021-12-07  2157  			if (!be->dpcm[stre=
am].be_start &&
3aa1e96a2b95e2 Pierre-Louis Bossart 2021-12-07  2158  			    (be->dpcm[stre=
am].state !=3D SND_SOC_DPCM_STATE_START) &&
3aa1e96a2b95e2 Pierre-Louis Bossart 2021-12-07  2159  			    (be->dpcm[stre=
am].state !=3D SND_SOC_DPCM_STATE_PAUSED))
b2ae80663008a7 Takashi Iwai         2021-12-07  2160  				goto next;
6479f7588651cb Pierre-Louis Bossart 2021-08-17  2161  =

5b3ffa2283999b Pierre-Louis Bossart 2022-03-21  2162  			fe->dpcm[stream].f=
e_pause =3D false;
5b3ffa2283999b Pierre-Louis Bossart 2022-03-21  2163  			be->dpcm[stream].b=
e_pause--;
5b3ffa2283999b Pierre-Louis Bossart 2022-03-21  2164  =

848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2165  			be->dpcm[stream].b=
e_start++;
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2166  			if (be->dpcm[strea=
m].be_start !=3D 1)
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2167  				goto next;
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2168  =

a9faca15a644ff Kuninori Morimoto    2020-12-01  2169  			ret =3D soc_pcm_tr=
igger(be_substream, cmd);
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2170  			if (ret) {
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2171  				be->dpcm[stream].=
be_start--;
b2ae80663008a7 Takashi Iwai         2021-12-07  2172  				goto next;
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2173  			}
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2174  =

3202e2f5fac003 Mark Brown           2021-08-30  2175  			be->dpcm[stream].s=
tate =3D SND_SOC_DPCM_STATE_START;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2176  			break;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2177  		case SNDRV_PCM_TRIG=
GER_STOP:
21fca8bdbb64df =EC=9D=B4=EA=B2=BD=ED=83=9D               2020-04-01  2178  =
			if ((be->dpcm[stream].state !=3D SND_SOC_DPCM_STATE_START) &&
3202e2f5fac003 Mark Brown           2021-08-30  2179  			    (be->dpcm[stre=
am].state !=3D SND_SOC_DPCM_STATE_PAUSED))
b2ae80663008a7 Takashi Iwai         2021-12-07  2180  				goto next;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2181  =

848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2182  			if (be->dpcm[strea=
m].state =3D=3D SND_SOC_DPCM_STATE_START)
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2183  				be->dpcm[stream].=
be_start--;
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2184  =

848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2185  			if (be->dpcm[strea=
m].be_start !=3D 0)
b2ae80663008a7 Takashi Iwai         2021-12-07  2186  				goto next;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2187  =

5b3ffa2283999b Pierre-Louis Bossart 2022-03-21  2188  			pause_stop_transit=
ion =3D false;
5b3ffa2283999b Pierre-Louis Bossart 2022-03-21  2189  			if (fe->dpcm[strea=
m].fe_pause) {
5b3ffa2283999b Pierre-Louis Bossart 2022-03-21  2190  				pause_stop_transi=
tion =3D true;
5b3ffa2283999b Pierre-Louis Bossart 2022-03-21  2191  				fe->dpcm[stream].=
fe_pause =3D false;
5b3ffa2283999b Pierre-Louis Bossart 2022-03-21  2192  				be->dpcm[stream].=
be_pause--;
5b3ffa2283999b Pierre-Louis Bossart 2022-03-21  2193  			}
5b3ffa2283999b Pierre-Louis Bossart 2022-03-21  2194  =

5b3ffa2283999b Pierre-Louis Bossart 2022-03-21  2195  			if (be->dpcm[strea=
m].be_pause !=3D 0)
5b3ffa2283999b Pierre-Louis Bossart 2022-03-21  2196  				ret =3D soc_pcm_t=
rigger(be_substream, SNDRV_PCM_TRIGGER_PAUSE_PUSH);
5b3ffa2283999b Pierre-Louis Bossart 2022-03-21  2197  			else
5b3ffa2283999b Pierre-Louis Bossart 2022-03-21  2198  				ret =3D soc_pcm_t=
rigger(be_substream, SNDRV_PCM_TRIGGER_STOP);
5b3ffa2283999b Pierre-Louis Bossart 2022-03-21  2199  =

848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2200  			if (ret) {
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2201  				if (be->dpcm[stre=
am].state =3D=3D SND_SOC_DPCM_STATE_START)
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2202  					be->dpcm[stream]=
.be_start++;
5b3ffa2283999b Pierre-Louis Bossart 2022-03-21  2203  				if (pause_stop_tr=
ansition) {
5b3ffa2283999b Pierre-Louis Bossart 2022-03-21  2204  					fe->dpcm[stream]=
.fe_pause =3D true;
5b3ffa2283999b Pierre-Louis Bossart 2022-03-21  2205  					be->dpcm[stream]=
.be_pause++;
5b3ffa2283999b Pierre-Louis Bossart 2022-03-21  2206  				}
b2ae80663008a7 Takashi Iwai         2021-12-07  2207  				goto next;
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2208  			}
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2209  =

5b3ffa2283999b Pierre-Louis Bossart 2022-03-21  2210  			if (be->dpcm[strea=
m].be_pause !=3D 0)
5b3ffa2283999b Pierre-Louis Bossart 2022-03-21  2211  				be->dpcm[stream].=
state =3D SND_SOC_DPCM_STATE_PAUSED;
5b3ffa2283999b Pierre-Louis Bossart 2022-03-21  2212  			else
3202e2f5fac003 Mark Brown           2021-08-30  2213  				be->dpcm[stream].=
state =3D SND_SOC_DPCM_STATE_STOP;
5b3ffa2283999b Pierre-Louis Bossart 2022-03-21  2214  =

01d7584cd2e5a9 Liam Girdwood        2012-04-25  2215  			break;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2216  		case SNDRV_PCM_TRIG=
GER_SUSPEND:
3202e2f5fac003 Mark Brown           2021-08-30  2217  			if (be->dpcm[strea=
m].state !=3D SND_SOC_DPCM_STATE_START)
b2ae80663008a7 Takashi Iwai         2021-12-07  2218  				goto next;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2219  =

848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2220  			be->dpcm[stream].b=
e_start--;
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2221  			if (be->dpcm[strea=
m].be_start !=3D 0)
b2ae80663008a7 Takashi Iwai         2021-12-07  2222  				goto next;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2223  =

a9faca15a644ff Kuninori Morimoto    2020-12-01  2224  			ret =3D soc_pcm_tr=
igger(be_substream, cmd);
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2225  			if (ret) {
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2226  				be->dpcm[stream].=
be_start++;
b2ae80663008a7 Takashi Iwai         2021-12-07  2227  				goto next;
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2228  			}
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2229  =

3202e2f5fac003 Mark Brown           2021-08-30  2230  			be->dpcm[stream].s=
tate =3D SND_SOC_DPCM_STATE_SUSPEND;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2231  			break;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2232  		case SNDRV_PCM_TRIG=
GER_PAUSE_PUSH:
3202e2f5fac003 Mark Brown           2021-08-30  2233  			if (be->dpcm[strea=
m].state !=3D SND_SOC_DPCM_STATE_START)
b2ae80663008a7 Takashi Iwai         2021-12-07  2234  				goto next;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2235  =

5b3ffa2283999b Pierre-Louis Bossart 2022-03-21  2236  			fe->dpcm[stream].f=
e_pause =3D true;
5b3ffa2283999b Pierre-Louis Bossart 2022-03-21  2237  			be->dpcm[stream].b=
e_pause++;
5b3ffa2283999b Pierre-Louis Bossart 2022-03-21  2238  =

848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2239  			be->dpcm[stream].b=
e_start--;
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2240  			if (be->dpcm[strea=
m].be_start !=3D 0)
b2ae80663008a7 Takashi Iwai         2021-12-07  2241  				goto next;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2242  =

a9faca15a644ff Kuninori Morimoto    2020-12-01  2243  			ret =3D soc_pcm_tr=
igger(be_substream, cmd);
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2244  			if (ret) {
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2245  				be->dpcm[stream].=
be_start++;
b2ae80663008a7 Takashi Iwai         2021-12-07  2246  				goto next;
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2247  			}
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2248  =

3202e2f5fac003 Mark Brown           2021-08-30  2249  			be->dpcm[stream].s=
tate =3D SND_SOC_DPCM_STATE_PAUSED;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2250  			break;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2251  		}
b2ae80663008a7 Takashi Iwai         2021-12-07  2252  next:
b2ae80663008a7 Takashi Iwai         2021-12-07  2253  		snd_soc_dpcm_stream=
_unlock_irqrestore(be, stream, flags);
b2ae80663008a7 Takashi Iwai         2021-12-07  2254  		if (ret)
b2ae80663008a7 Takashi Iwai         2021-12-07  2255  			break;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2256  	}
db3aa39c910684 Kuninori Morimoto    2021-03-15  2257  	if (ret < 0)
db3aa39c910684 Kuninori Morimoto    2021-03-15  2258  		dev_err(fe->dev, "A=
SoC: %s() failed at %s (%d)\n",
db3aa39c910684 Kuninori Morimoto    2021-03-15  2259  			__func__, be->dai_=
link->name, ret);
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2260  	return ret;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2261  }
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2262  EXPORT_SYMBOL_GPL(dpc=
m_be_dai_trigger);
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2263  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5259506423476892683==--

