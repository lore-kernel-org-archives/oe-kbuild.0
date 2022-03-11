Content-Type: multipart/mixed; boundary="===============4090263416168076305=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:broonie/sound/for-5.18 33/171] sound/soc/sof/compress.c:54 snd_sof_compr_fragment_elapsed() warn: variable dereferenced before check 'cstream' (see line 48)
Date: Sat, 12 Mar 2022 00:16:37 +0800
Message-ID: <202203120019.KjXsD7LN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4090263416168076305==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Daniel Baluta <daniel.baluta@nxp.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://github.com/ammarfaizi2/linux-block broonie/sound/for-5.18
head:   6b6bb5e26222021abe1c5360f43b4c2ff1dd012f
commit: 6324cf901e14c6662be508f30485e0f09c54694d [33/171] ASoC: SOF: compr:=
 Add compress ops implementation
:::::: branch date: 28 hours ago
:::::: commit date: 4 weeks ago
config: microblaze-randconfig-m031-20220310 (https://download.01.org/0day-c=
i/archive/20220312/202203120019.KjXsD7LN-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
sound/soc/sof/compress.c:54 snd_sof_compr_fragment_elapsed() warn: variable=
 dereferenced before check 'cstream' (see line 48)

Old smatch warnings:
arch/microblaze/include/asm/thread_info.h:91 current_thread_info() error: u=
ninitialized symbol 'sp'.

vim +/cstream +54 sound/soc/sof/compress.c

858f7a5c45cacb Daniel Baluta 2021-10-04  42  =

858f7a5c45cacb Daniel Baluta 2021-10-04  43  /*
858f7a5c45cacb Daniel Baluta 2021-10-04  44   * sof compr fragment elapse, =
this could be called in irq thread context
858f7a5c45cacb Daniel Baluta 2021-10-04  45   */
858f7a5c45cacb Daniel Baluta 2021-10-04  46  void snd_sof_compr_fragment_el=
apsed(struct snd_compr_stream *cstream)
858f7a5c45cacb Daniel Baluta 2021-10-04  47  {
6324cf901e14c6 Daniel Baluta 2022-01-20 @48  	struct snd_soc_pcm_runtime *r=
td =3D cstream->private_data;
6324cf901e14c6 Daniel Baluta 2022-01-20  49  	struct snd_compr_runtime *crt=
d =3D cstream->runtime;
858f7a5c45cacb Daniel Baluta 2021-10-04  50  	struct snd_soc_component *com=
ponent;
6324cf901e14c6 Daniel Baluta 2022-01-20  51  	struct snd_compr_tstamp *tsta=
mp;
858f7a5c45cacb Daniel Baluta 2021-10-04  52  	struct snd_sof_pcm *spcm;
858f7a5c45cacb Daniel Baluta 2021-10-04  53  =

858f7a5c45cacb Daniel Baluta 2021-10-04 @54  	if (!cstream)
858f7a5c45cacb Daniel Baluta 2021-10-04  55  		return;
858f7a5c45cacb Daniel Baluta 2021-10-04  56  =

6324cf901e14c6 Daniel Baluta 2022-01-20  57  	tstamp =3D crtd->private_data;
858f7a5c45cacb Daniel Baluta 2021-10-04  58  	component =3D snd_soc_rtdcom_=
lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
858f7a5c45cacb Daniel Baluta 2021-10-04  59  =

858f7a5c45cacb Daniel Baluta 2021-10-04  60  	spcm =3D snd_sof_find_spcm_da=
i(component, rtd);
858f7a5c45cacb Daniel Baluta 2021-10-04  61  	if (!spcm) {
858f7a5c45cacb Daniel Baluta 2021-10-04  62  		dev_err(component->dev,
858f7a5c45cacb Daniel Baluta 2021-10-04  63  			"fragment elapsed called fo=
r unknown stream!\n");
858f7a5c45cacb Daniel Baluta 2021-10-04  64  		return;
858f7a5c45cacb Daniel Baluta 2021-10-04  65  	}
858f7a5c45cacb Daniel Baluta 2021-10-04  66  =

6324cf901e14c6 Daniel Baluta 2022-01-20  67  	sof_set_transferred_bytes(tst=
amp, spcm->stream[cstream->direction].posn.host_posn,
6324cf901e14c6 Daniel Baluta 2022-01-20  68  				  crtd->buffer_size);
6324cf901e14c6 Daniel Baluta 2022-01-20  69  =

858f7a5c45cacb Daniel Baluta 2021-10-04  70  	/* use the same workqueue-bas=
ed solution as for PCM, cf. snd_sof_pcm_elapsed */
858f7a5c45cacb Daniel Baluta 2021-10-04  71  	schedule_work(&spcm->stream[c=
stream->direction].period_elapsed_work);
858f7a5c45cacb Daniel Baluta 2021-10-04  72  }
6324cf901e14c6 Daniel Baluta 2022-01-20  73  =


:::::: The code at line 54 was first introduced by commit
:::::: 858f7a5c45cacbf9965c4735330ee34baa0728f4 ASoC: SOF: Introduce fragme=
nt elapsed notification API

:::::: TO: Daniel Baluta <daniel.baluta@nxp.com>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4090263416168076305==--

