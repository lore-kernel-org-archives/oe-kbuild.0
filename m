Content-Type: multipart/mixed; boundary="===============0807525242628228540=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [plbossart-sound:fix/hda-dai-suspend-rebase 13/13] sound/soc/soc-pcm.c:2185 dpcm_be_dai_trigger() error: uninitialized symbol 'pause_stop_transition'.
Date: Tue, 22 Mar 2022 13:50:37 +0800
Message-ID: <202203221355.0ZkwqWis-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0807525242628228540==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>

tree:   https://github.com/thesofproject/linux fix/hda-dai-suspend-rebase
head:   0ac790d31cc43959a77de573c8f0e9090313c69c
commit: 0ac790d31cc43959a77de573c8f0e9090313c69c [13/13] ASoC: sof-pcm: imp=
rove BE transition for PAUSE_RELEASE
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: i386-randconfig-m021-20220321 (https://download.01.org/0day-ci/arch=
ive/20220322/202203221355.0ZkwqWis-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
sound/soc/soc-pcm.c:2185 dpcm_be_dai_trigger() error: uninitialized symbol =
'pause_stop_transition'.

vim +/pause_stop_transition +2185 sound/soc/soc-pcm.c

01d7584cd2e5a9 Liam Girdwood        2012-04-25  2088  =

23607025303af6 Liam Girdwood        2014-01-17  2089  int dpcm_be_dai_trigg=
er(struct snd_soc_pcm_runtime *fe, int stream,
45c0a188ca59e7 Mark Brown           2012-05-09  2090  			       int cmd)
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2091  {
db3aa39c910684 Kuninori Morimoto    2021-03-15  2092  	struct snd_soc_pcm_r=
untime *be;
0ac790d31cc439 Pierre-Louis Bossart 2022-03-21  2093  	bool pause_stop_tran=
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

a9faca15a644ff Kuninori Morimoto    2020-12-01  2125  			ret =3D soc_pcm_tr=
igger(be_substream, cmd);
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2126  			if (ret) {
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2127  				be->dpcm[stream].=
be_start--;
b2ae80663008a7 Takashi Iwai         2021-12-07  2128  				goto next;
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2129  			}
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2130  =

3202e2f5fac003 Mark Brown           2021-08-30  2131  			be->dpcm[stream].s=
tate =3D SND_SOC_DPCM_STATE_START;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2132  			break;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2133  		case SNDRV_PCM_TRIG=
GER_RESUME:
3202e2f5fac003 Mark Brown           2021-08-30  2134  			if ((be->dpcm[stre=
am].state !=3D SND_SOC_DPCM_STATE_SUSPEND))
b2ae80663008a7 Takashi Iwai         2021-12-07  2135  				goto next;
6479f7588651cb Pierre-Louis Bossart 2021-08-17  2136  =

848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2137  			be->dpcm[stream].b=
e_start++;
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2138  			if (be->dpcm[strea=
m].be_start !=3D 1)
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2139  				goto next;
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2140  =

a9faca15a644ff Kuninori Morimoto    2020-12-01  2141  			ret =3D soc_pcm_tr=
igger(be_substream, cmd);
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2142  			if (ret) {
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2143  				be->dpcm[stream].=
be_start--;
b2ae80663008a7 Takashi Iwai         2021-12-07  2144  				goto next;
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2145  			}
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2146  =

3202e2f5fac003 Mark Brown           2021-08-30  2147  			be->dpcm[stream].s=
tate =3D SND_SOC_DPCM_STATE_START;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2148  			break;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2149  		case SNDRV_PCM_TRIG=
GER_PAUSE_RELEASE:
3aa1e96a2b95e2 Pierre-Louis Bossart 2021-12-07  2150  			if (!be->dpcm[stre=
am].be_start &&
3aa1e96a2b95e2 Pierre-Louis Bossart 2021-12-07  2151  			    (be->dpcm[stre=
am].state !=3D SND_SOC_DPCM_STATE_START) &&
3aa1e96a2b95e2 Pierre-Louis Bossart 2021-12-07  2152  			    (be->dpcm[stre=
am].state !=3D SND_SOC_DPCM_STATE_STOP) &&
3aa1e96a2b95e2 Pierre-Louis Bossart 2021-12-07  2153  			    (be->dpcm[stre=
am].state !=3D SND_SOC_DPCM_STATE_PAUSED))
b2ae80663008a7 Takashi Iwai         2021-12-07  2154  				goto next;
6479f7588651cb Pierre-Louis Bossart 2021-08-17  2155  =

0ac790d31cc439 Pierre-Louis Bossart 2022-03-21  2156  			fe->dpcm[stream].f=
e_pause =3D false;
0ac790d31cc439 Pierre-Louis Bossart 2022-03-21  2157  			be->dpcm[stream].b=
e_pause--;
0ac790d31cc439 Pierre-Louis Bossart 2022-03-21  2158  =

848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2159  			be->dpcm[stream].b=
e_start++;
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2160  			if (be->dpcm[strea=
m].be_start !=3D 1)
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2161  				goto next;
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2162  =

a9faca15a644ff Kuninori Morimoto    2020-12-01  2163  			ret =3D soc_pcm_tr=
igger(be_substream, cmd);
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2164  			if (ret) {
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2165  				be->dpcm[stream].=
be_start--;
b2ae80663008a7 Takashi Iwai         2021-12-07  2166  				goto next;
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2167  			}
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2168  =

3202e2f5fac003 Mark Brown           2021-08-30  2169  			be->dpcm[stream].s=
tate =3D SND_SOC_DPCM_STATE_START;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2170  			break;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2171  		case SNDRV_PCM_TRIG=
GER_STOP:
21fca8bdbb64df =EC=9D=B4=EA=B2=BD=ED=83=9D               2020-04-01  2172  =
			if ((be->dpcm[stream].state !=3D SND_SOC_DPCM_STATE_START) &&
3202e2f5fac003 Mark Brown           2021-08-30  2173  			    (be->dpcm[stre=
am].state !=3D SND_SOC_DPCM_STATE_PAUSED))
b2ae80663008a7 Takashi Iwai         2021-12-07  2174  				goto next;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2175  =

848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2176  			if (be->dpcm[strea=
m].state =3D=3D SND_SOC_DPCM_STATE_START)
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2177  				be->dpcm[stream].=
be_start--;
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2178  =

848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2179  			if (be->dpcm[strea=
m].be_start !=3D 0)
b2ae80663008a7 Takashi Iwai         2021-12-07  2180  				goto next;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2181  =

0ac790d31cc439 Pierre-Louis Bossart 2022-03-21  2182  			if (fe->dpcm[strea=
m].fe_pause)
0ac790d31cc439 Pierre-Louis Bossart 2022-03-21  2183  				pause_stop_transi=
tion =3D true;
0ac790d31cc439 Pierre-Louis Bossart 2022-03-21  2184  =

0ac790d31cc439 Pierre-Louis Bossart 2022-03-21 @2185  			if (pause_stop_tra=
nsition) {
0ac790d31cc439 Pierre-Louis Bossart 2022-03-21  2186  				fe->dpcm[stream].=
fe_pause =3D false;
0ac790d31cc439 Pierre-Louis Bossart 2022-03-21  2187  				be->dpcm[stream].=
be_pause--;
0ac790d31cc439 Pierre-Louis Bossart 2022-03-21  2188  			}
0ac790d31cc439 Pierre-Louis Bossart 2022-03-21  2189  =

0ac790d31cc439 Pierre-Louis Bossart 2022-03-21  2190  			if (be->dpcm[strea=
m].be_pause !=3D 0)
0ac790d31cc439 Pierre-Louis Bossart 2022-03-21  2191  				ret =3D soc_pcm_t=
rigger(be_substream, SNDRV_PCM_TRIGGER_PAUSE_PUSH);
0ac790d31cc439 Pierre-Louis Bossart 2022-03-21  2192  			else
0ac790d31cc439 Pierre-Louis Bossart 2022-03-21  2193  				ret =3D soc_pcm_t=
rigger(be_substream, SNDRV_PCM_TRIGGER_STOP);
0ac790d31cc439 Pierre-Louis Bossart 2022-03-21  2194  =

848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2195  			if (ret) {
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2196  				if (be->dpcm[stre=
am].state =3D=3D SND_SOC_DPCM_STATE_START)
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2197  					be->dpcm[stream]=
.be_start++;
0ac790d31cc439 Pierre-Louis Bossart 2022-03-21  2198  				if (pause_stop_tr=
ansition) {
0ac790d31cc439 Pierre-Louis Bossart 2022-03-21  2199  					fe->dpcm[stream]=
.fe_pause =3D true;
0ac790d31cc439 Pierre-Louis Bossart 2022-03-21  2200  					be->dpcm[stream]=
.be_pause++;
0ac790d31cc439 Pierre-Louis Bossart 2022-03-21  2201  				}
b2ae80663008a7 Takashi Iwai         2021-12-07  2202  				goto next;
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2203  			}
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2204  =

0ac790d31cc439 Pierre-Louis Bossart 2022-03-21  2205  			if (be->dpcm[strea=
m].be_pause !=3D 0)
0ac790d31cc439 Pierre-Louis Bossart 2022-03-21  2206  				be->dpcm[stream].=
state =3D SND_SOC_DPCM_STATE_PAUSED;
0ac790d31cc439 Pierre-Louis Bossart 2022-03-21  2207  			else
3202e2f5fac003 Mark Brown           2021-08-30  2208  				be->dpcm[stream].=
state =3D SND_SOC_DPCM_STATE_STOP;
0ac790d31cc439 Pierre-Louis Bossart 2022-03-21  2209  =

01d7584cd2e5a9 Liam Girdwood        2012-04-25  2210  			break;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2211  		case SNDRV_PCM_TRIG=
GER_SUSPEND:
3202e2f5fac003 Mark Brown           2021-08-30  2212  			if (be->dpcm[strea=
m].state !=3D SND_SOC_DPCM_STATE_START)
b2ae80663008a7 Takashi Iwai         2021-12-07  2213  				goto next;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2214  =

848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2215  			be->dpcm[stream].b=
e_start--;
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2216  			if (be->dpcm[strea=
m].be_start !=3D 0)
b2ae80663008a7 Takashi Iwai         2021-12-07  2217  				goto next;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2218  =

a9faca15a644ff Kuninori Morimoto    2020-12-01  2219  			ret =3D soc_pcm_tr=
igger(be_substream, cmd);
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2220  			if (ret) {
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2221  				be->dpcm[stream].=
be_start++;
b2ae80663008a7 Takashi Iwai         2021-12-07  2222  				goto next;
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2223  			}
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2224  =

3202e2f5fac003 Mark Brown           2021-08-30  2225  			be->dpcm[stream].s=
tate =3D SND_SOC_DPCM_STATE_SUSPEND;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2226  			break;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2227  		case SNDRV_PCM_TRIG=
GER_PAUSE_PUSH:
3202e2f5fac003 Mark Brown           2021-08-30  2228  			if (be->dpcm[strea=
m].state !=3D SND_SOC_DPCM_STATE_START)
b2ae80663008a7 Takashi Iwai         2021-12-07  2229  				goto next;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2230  =

0ac790d31cc439 Pierre-Louis Bossart 2022-03-21  2231  			fe->dpcm[stream].f=
e_pause =3D true;
0ac790d31cc439 Pierre-Louis Bossart 2022-03-21  2232  			be->dpcm[stream].b=
e_pause++;
0ac790d31cc439 Pierre-Louis Bossart 2022-03-21  2233  =

848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2234  			be->dpcm[stream].b=
e_start--;
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2235  			if (be->dpcm[strea=
m].be_start !=3D 0)
b2ae80663008a7 Takashi Iwai         2021-12-07  2236  				goto next;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2237  =

a9faca15a644ff Kuninori Morimoto    2020-12-01  2238  			ret =3D soc_pcm_tr=
igger(be_substream, cmd);
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2239  			if (ret) {
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2240  				be->dpcm[stream].=
be_start++;
b2ae80663008a7 Takashi Iwai         2021-12-07  2241  				goto next;
848aedfdc6ba25 Pierre-Louis Bossart 2021-12-07  2242  			}
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2243  =

3202e2f5fac003 Mark Brown           2021-08-30  2244  			be->dpcm[stream].s=
tate =3D SND_SOC_DPCM_STATE_PAUSED;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2245  			break;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2246  		}
b2ae80663008a7 Takashi Iwai         2021-12-07  2247  next:
b2ae80663008a7 Takashi Iwai         2021-12-07  2248  		snd_soc_dpcm_stream=
_unlock_irqrestore(be, stream, flags);
b2ae80663008a7 Takashi Iwai         2021-12-07  2249  		if (ret)
b2ae80663008a7 Takashi Iwai         2021-12-07  2250  			break;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2251  	}
db3aa39c910684 Kuninori Morimoto    2021-03-15  2252  	if (ret < 0)
db3aa39c910684 Kuninori Morimoto    2021-03-15  2253  		dev_err(fe->dev, "A=
SoC: %s() failed at %s (%d)\n",
db3aa39c910684 Kuninori Morimoto    2021-03-15  2254  			__func__, be->dai_=
link->name, ret);
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2255  	return ret;
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2256  }
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2257  EXPORT_SYMBOL_GPL(dpc=
m_be_dai_trigger);
01d7584cd2e5a9 Liam Girdwood        2012-04-25  2258  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0807525242628228540==--

