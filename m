Content-Type: multipart/mixed; boundary="===============5434272006033547464=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [broonie-misc:asoc-5.19 164/183] sound/soc/soc-component.c:936:38: warning: Parameter 'component' can be declared with const [constParameter]
Date: Mon, 23 May 2022 10:52:26 +0800
Message-ID: <202205231011.c9Fg117M-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5434272006033547464==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Charles Keepax <ckeepax@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git as=
oc-5.19
head:   e5cd20e0d6713138444cc3f3f982712cf9a36143
commit: 232213bd73bbb381b05b729829fdb5d00e0a8fdf [164/183] ASoC: soc-compon=
ent: Update handling to component delays
:::::: branch date: 3 days ago
:::::: commit date: 7 days ago
compiler: aarch64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 232213bd73bbb381b05b729829fdb5d00e0a8fdf
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   sound/soc/soc-component.c:276:13: warning: Parameter 'mark' can be decla=
red with const [constParameter]
         void *mark, int upon_open, int rollback)
               ^
>> sound/soc/soc-component.c:936:38: warning: Parameter 'component' can be =
declared with const [constParameter]
              struct snd_soc_component *component)
                                        ^
   sound/soc/soc-component.c:1229:14: warning: Parameter 'stream' can be de=
clared with const [constParameter]
          void *stream, int rollback)
                ^

vim +/component +936 sound/soc/soc-component.c

96a47908d87694 Kuninori Morimoto 2019-07-26  934  =

232213bd73bbb3 Charles Keepax    2022-05-13  935  static bool snd_soc_compo=
nent_is_codec_on_rtd(struct snd_soc_pcm_runtime *rtd,
232213bd73bbb3 Charles Keepax    2022-05-13 @936  					      struct snd_soc=
_component *component)
232213bd73bbb3 Charles Keepax    2022-05-13  937  {
232213bd73bbb3 Charles Keepax    2022-05-13  938  	struct snd_soc_dai *dai;
232213bd73bbb3 Charles Keepax    2022-05-13  939  	int i;
232213bd73bbb3 Charles Keepax    2022-05-13  940  =

232213bd73bbb3 Charles Keepax    2022-05-13  941  	for_each_rtd_codec_dais(=
rtd, i, dai) {
232213bd73bbb3 Charles Keepax    2022-05-13  942  		if (dai->component =3D=
=3D component)
232213bd73bbb3 Charles Keepax    2022-05-13  943  			return true;
232213bd73bbb3 Charles Keepax    2022-05-13  944  	}
232213bd73bbb3 Charles Keepax    2022-05-13  945  =

232213bd73bbb3 Charles Keepax    2022-05-13  946  	return false;
232213bd73bbb3 Charles Keepax    2022-05-13  947  }
232213bd73bbb3 Charles Keepax    2022-05-13  948  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5434272006033547464==--

