Content-Type: multipart/mixed; boundary="===============5149835529195674795=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [morimoto-linux:fw-cleanup-2020-09-18-v1 63/78] sound/soc/soc-pcm.c:2306:6: warning: Variable 'err' is reassigned a value before the old one has been used.
Date: Sat, 19 Sep 2020 00:24:34 +0800
Message-ID: <202009190026.2dJJcVHT%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5149835529195674795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux fw-cleanup-2020-09-18-v1
head:   4f9e6f32d18a2f52dbb9fe4a1e29823f8d0612df
commit: 99f019238f8f0dd8019fa26cc54128e976ea3c6b [63/78] ASoC: don't indica=
te error message for snd_soc_dai_xxx()
:::::: branch date: 10 hours ago
:::::: commit date: 5 days ago
compiler: mipsel-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   sound/soc/soc-pcm.c:702:10: warning: Variable 'err_msg' is reassigned a =
value before the old one has been used. [redundantAssignment]
    err_msg =3D "formats";
            ^
   sound/soc/soc-pcm.c:698:10: note: Variable 'err_msg' is reassigned a val=
ue before the old one has been used.
    err_msg =3D "rates";
            ^
   sound/soc/soc-pcm.c:702:10: note: Variable 'err_msg' is reassigned a val=
ue before the old one has been used.
    err_msg =3D "formats";
            ^
   sound/soc/soc-pcm.c:706:10: warning: Variable 'err_msg' is reassigned a =
value before the old one has been used. [redundantAssignment]
    err_msg =3D "channels";
            ^
   sound/soc/soc-pcm.c:702:10: note: Variable 'err_msg' is reassigned a val=
ue before the old one has been used.
    err_msg =3D "formats";
            ^
   sound/soc/soc-pcm.c:706:10: note: Variable 'err_msg' is reassigned a val=
ue before the old one has been used.
    err_msg =3D "channels";
            ^
   sound/soc/soc-pcm.c:1444:26: warning: Variable 'be->dpcm[stream].state' =
is reassigned a value before the old one has been used. [redundantAssignmen=
t]
     be->dpcm[stream].state =3D SND_SOC_DPCM_STATE_CLOSE;
                            ^
   sound/soc/soc-pcm.c:1438:28: note: Variable 'be->dpcm[stream].state' is =
reassigned a value before the old one has been used.
       be->dpcm[stream].state =3D SND_SOC_DPCM_STATE_HW_FREE;
                              ^
   sound/soc/soc-pcm.c:1444:26: note: Variable 'be->dpcm[stream].state' is =
reassigned a value before the old one has been used.
     be->dpcm[stream].state =3D SND_SOC_DPCM_STATE_CLOSE;
                            ^
>> sound/soc/soc-pcm.c:2306:6: warning: Variable 'err' is reassigned a valu=
e before the old one has been used. [redundantAssignment]
    err =3D dpcm_be_dai_hw_free(fe, stream);
        ^
   sound/soc/soc-pcm.c:2296:7: note: Variable 'err' is reassigned a value b=
efore the old one has been used.
     err =3D snd_soc_pcm_dai_bespoke_trigger(substream, SNDRV_PCM_TRIGGER_S=
TOP);
         ^
   sound/soc/soc-pcm.c:2306:6: note: Variable 'err' is reassigned a value b=
efore the old one has been used.
    err =3D dpcm_be_dai_hw_free(fe, stream);
        ^
   sound/soc/soc-pcm.c:1703:7: warning: Local variable i shadows outer vari=
able [shadowVar]
     int i;
         ^
   sound/soc/soc-pcm.c:1684:6: note: Shadowed declaration
    int i;
        ^
   sound/soc/soc-pcm.c:1703:7: note: Shadow variable
     int i;
         ^

# https://github.com/morimoto/linux/commit/99f019238f8f0dd8019fa26cc54128e9=
76ea3c6b
git remote add morimoto-linux https://github.com/morimoto/linux
git fetch --no-tags morimoto-linux fw-cleanup-2020-09-18-v1
git checkout 99f019238f8f0dd8019fa26cc54128e976ea3c6b
vim +/err +2306 sound/soc/soc-pcm.c

01d7584cd2e5a93 Liam Girdwood     2012-04-25  2280  =

618dae11f809aac Liam Girdwood     2012-04-25  2281  static int dpcm_run_upd=
ate_shutdown(struct snd_soc_pcm_runtime *fe, int stream)
618dae11f809aac Liam Girdwood     2012-04-25  2282  {
07bf84aaf736781 Liam Girdwood     2012-04-25  2283  	struct snd_pcm_substre=
am *substream =3D
07bf84aaf736781 Liam Girdwood     2012-04-25  2284  		snd_soc_dpcm_get_subs=
tream(fe, stream);
07bf84aaf736781 Liam Girdwood     2012-04-25  2285  	enum snd_soc_dpcm_trig=
ger trigger =3D fe->dai_link->trigger[stream];
618dae11f809aac Liam Girdwood     2012-04-25  2286  	int err;
618dae11f809aac Liam Girdwood     2012-04-25  2287  =

103d84a3cbe1e70 Liam Girdwood     2012-11-19  2288  	dev_dbg(fe->dev, "ASoC=
: runtime %s close on FE %s\n",
618dae11f809aac Liam Girdwood     2012-04-25  2289  			stream ? "capture" :=
 "playback", fe->dai_link->name);
618dae11f809aac Liam Girdwood     2012-04-25  2290  =

07bf84aaf736781 Liam Girdwood     2012-04-25  2291  	if (trigger =3D=3D SND=
_SOC_DPCM_TRIGGER_BESPOKE) {
07bf84aaf736781 Liam Girdwood     2012-04-25  2292  		/* call bespoke trigg=
er - FE takes care of all BE triggers */
103d84a3cbe1e70 Liam Girdwood     2012-11-19  2293  		dev_dbg(fe->dev, "ASo=
C: bespoke trigger FE %s cmd stop\n",
07bf84aaf736781 Liam Girdwood     2012-04-25  2294  				fe->dai_link->name);
07bf84aaf736781 Liam Girdwood     2012-04-25  2295  =

30819358ae73326 Kuninori Morimoto 2020-04-24  2296  		err =3D snd_soc_pcm_d=
ai_bespoke_trigger(substream, SNDRV_PCM_TRIGGER_STOP);
07bf84aaf736781 Liam Girdwood     2012-04-25  2297  	} else {
103d84a3cbe1e70 Liam Girdwood     2012-11-19  2298  		dev_dbg(fe->dev, "ASo=
C: trigger FE %s cmd stop\n",
07bf84aaf736781 Liam Girdwood     2012-04-25  2299  			fe->dai_link->name);
07bf84aaf736781 Liam Girdwood     2012-04-25  2300  =

618dae11f809aac Liam Girdwood     2012-04-25  2301  		err =3D dpcm_be_dai_t=
rigger(fe, stream, SNDRV_PCM_TRIGGER_STOP);
618dae11f809aac Liam Girdwood     2012-04-25  2302  		if (err < 0)
103d84a3cbe1e70 Liam Girdwood     2012-11-19  2303  			dev_err(fe->dev,"ASo=
C: trigger FE failed %d\n", err);
07bf84aaf736781 Liam Girdwood     2012-04-25  2304  	}
618dae11f809aac Liam Girdwood     2012-04-25  2305  =

618dae11f809aac Liam Girdwood     2012-04-25 @2306  	err =3D dpcm_be_dai_hw=
_free(fe, stream);
618dae11f809aac Liam Girdwood     2012-04-25  2307  	if (err < 0)
103d84a3cbe1e70 Liam Girdwood     2012-11-19  2308  		dev_err(fe->dev,"ASoC=
: hw_free FE failed %d\n", err);
618dae11f809aac Liam Girdwood     2012-04-25  2309  =

396cba954ec97eb Kuninori Morimoto 2020-03-06  2310  	dpcm_be_dai_shutdown(f=
e, stream);
618dae11f809aac Liam Girdwood     2012-04-25  2311  =

618dae11f809aac Liam Girdwood     2012-04-25  2312  	/* run the stream even=
t for each BE */
618dae11f809aac Liam Girdwood     2012-04-25  2313  	dpcm_dapm_stream_event=
(fe, stream, SND_SOC_DAPM_STREAM_NOP);
618dae11f809aac Liam Girdwood     2012-04-25  2314  =

618dae11f809aac Liam Girdwood     2012-04-25  2315  	return 0;
618dae11f809aac Liam Girdwood     2012-04-25  2316  }
618dae11f809aac Liam Girdwood     2012-04-25  2317  =


:::::: The code at line 2306 was first introduced by commit
:::::: 618dae11f809aaccd05710aa8cee8c46a9cef1a7 ASoC: dpcm: Add runtime dyn=
amic route update

:::::: TO: Liam Girdwood <lrg@ti.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5149835529195674795==--

