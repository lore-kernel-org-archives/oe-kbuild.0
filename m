Content-Type: multipart/mixed; boundary="===============2283560794097819703=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/codecs/wm_adsp.c:1100:13: warning: Uninitialized variable: tmp->name [uninitvar]
Date: Thu, 19 May 2022 16:02:22 +0800
Message-ID: <202205191623.xvy5fDKn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2283560794097819703==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Simon Trimmer <simont@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>
CC: Charles Keepax <ckeepax@opensource.cirrus.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f993aed406eaf968ba3867a76bb46c95336a33d0
commit: f6bc909e7673c30abcbdb329e7d0aa2e83c103d7 firmware: cs_dsp: add driv=
er to support firmware loading on Cirrus Logic DSPs
date:   8 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 8 months ago
compiler: xtensa-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout f6bc909e7673c30abcbdb329e7d0aa2e83c103d7
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> sound/soc/codecs/wm_adsp.c:1100:13: warning: Uninitialized variable: tmp=
->name [uninitvar]
     if (!tmp->name || !strcmp(compr->name, tmp->name)) {
               ^
   sound/soc/codecs/wm_adsp.c:1096:16: note: Assuming condition is false
    if (compr->dsp->fatal_error)
                  ^
   sound/soc/codecs/wm_adsp.c:1100:13: note: Uninitialized variable: tmp->n=
ame
     if (!tmp->name || !strcmp(compr->name, tmp->name)) {
               ^
>> sound/soc/codecs/wm_adsp.c:1550:29: warning: Uninitialized variable: buf=
->compr [uninitvar]
     wm_adsp_compr_detach(buf->compr);
                               ^
>> sound/soc/codecs/wm_adsp.c:1930:14: warning: Uninitialized variable: com=
pr->stream [uninitvar]
     if (compr->stream)
                ^

vim +1100 sound/soc/codecs/wm_adsp.c

edd713509ae46f Charles Keepax   2016-05-04  1091  =

edd713509ae46f Charles Keepax   2016-05-04  1092  static int wm_adsp_compr_=
attach(struct wm_adsp_compr *compr)
edd713509ae46f Charles Keepax   2016-05-04  1093  {
4f2d4eabf57718 Stuart Henderson 2019-02-22  1094  	struct wm_adsp_compr_buf=
 *buf =3D NULL, *tmp;
4f2d4eabf57718 Stuart Henderson 2019-02-22  1095  =

a2bcbc1b9ac2f9 Charles Keepax   2019-03-19  1096  	if (compr->dsp->fatal_er=
ror)
a2bcbc1b9ac2f9 Charles Keepax   2019-03-19  1097  		return -EINVAL;
a2bcbc1b9ac2f9 Charles Keepax   2019-03-19  1098  =

4f2d4eabf57718 Stuart Henderson 2019-02-22  1099  	list_for_each_entry(tmp,=
 &compr->dsp->buffer_list, list) {
4f2d4eabf57718 Stuart Henderson 2019-02-22 @1100  		if (!tmp->name || !strc=
mp(compr->name, tmp->name)) {
4f2d4eabf57718 Stuart Henderson 2019-02-22  1101  			buf =3D tmp;
4f2d4eabf57718 Stuart Henderson 2019-02-22  1102  			break;
4f2d4eabf57718 Stuart Henderson 2019-02-22  1103  		}
4f2d4eabf57718 Stuart Henderson 2019-02-22  1104  	}
4f2d4eabf57718 Stuart Henderson 2019-02-22  1105  =

4f2d4eabf57718 Stuart Henderson 2019-02-22  1106  	if (!buf)
edd713509ae46f Charles Keepax   2016-05-04  1107  		return -EINVAL;
edd713509ae46f Charles Keepax   2016-05-04  1108  =

4f2d4eabf57718 Stuart Henderson 2019-02-22  1109  	compr->buf =3D buf;
789b930a8f0de6 Charles Keepax   2019-04-02  1110  	buf->compr =3D compr;
edd713509ae46f Charles Keepax   2016-05-04  1111  =

edd713509ae46f Charles Keepax   2016-05-04  1112  	return 0;
edd713509ae46f Charles Keepax   2016-05-04  1113  }
edd713509ae46f Charles Keepax   2016-05-04  1114  =


:::::: The code at line 1100 was first introduced by commit
:::::: 4f2d4eabf57718875b97363a3bd35de490f354c5 ASoC: wm_adsp: Add support =
for multiple compressed buffers

:::::: TO: Stuart Henderson <stuarth@opensource.cirrus.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2283560794097819703==--

