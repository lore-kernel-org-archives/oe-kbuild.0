Content-Type: multipart/mixed; boundary="===============1252837964785851956=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:pending-fixes 1045/3707] sound/soc/fsl/fsl_easrc.c:1474:51: sparse: expected unsigned int sample_format
Date: Wed, 03 Jun 2020 18:01:49 +0800
Message-ID: <202006031845.LLveLZZ8%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1252837964785851956==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: "Shengjiu, Wang," <shengjiu.wang@nxp.com>
CC: Mark Brown <broonie@kernel.org>
CC: "Cosmin-Gabriel Samoila" <cosmin.samoila@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 pending-fixes
head:   4973fabb59f61553da8b677333357e016550eeef
commit: 955ac624058f91172b3b8820280556e699e1e0ff [1045/3707] ASoC: fsl_easr=
c: Add EASRC ASoC CPU DAI drivers
:::::: branch date: 11 hours ago
:::::: commit date: 6 weeks ago
config: microblaze-randconfig-s031-20200603 (attached as .config)
compiler: microblaze-linux-gcc (GCC) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-244-g0ee050a8-dirty
        git checkout 955ac624058f91172b3b8820280556e699e1e0ff
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 ARCH=3Dmicroblaze CF=3D'-fdiagnostic-prefix -D__CH=
ECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   sound/soc/fsl/fsl_easrc.c:566:33: sparse: sparse: restricted snd_pcm_for=
mat_t degrades to integer
   sound/soc/fsl/fsl_easrc.c:567:34: sparse: sparse: restricted snd_pcm_for=
mat_t degrades to integer
   sound/soc/fsl/fsl_easrc.c:569:38: sparse: sparse: restricted snd_pcm_for=
mat_t degrades to integer
   sound/soc/fsl/fsl_easrc.c:570:39: sparse: sparse: restricted snd_pcm_for=
mat_t degrades to integer
   sound/soc/fsl/fsl_easrc.c:612:33: sparse: sparse: restricted snd_pcm_for=
mat_t degrades to integer
   sound/soc/fsl/fsl_easrc.c:613:34: sparse: sparse: restricted snd_pcm_for=
mat_t degrades to integer
   sound/soc/fsl/fsl_easrc.c:619:40: sparse: sparse: restricted snd_pcm_for=
mat_t degrades to integer
   sound/soc/fsl/fsl_easrc.c:620:41: sparse: sparse: restricted snd_pcm_for=
mat_t degrades to integer
   sound/soc/fsl/fsl_easrc.c:967:5: sparse: sparse: symbol 'fsl_easrc_confi=
g_context' was not declared. Should it be static?
   sound/soc/fsl/fsl_easrc.c:1128:5: sparse: sparse: symbol 'fsl_easrc_set_=
ctx_format' was not declared. Should it be static?
   sound/soc/fsl/fsl_easrc.c:1201:5: sparse: sparse: symbol 'fsl_easrc_set_=
ctx_organziation' was not declared. Should it be static?
   sound/soc/fsl/fsl_easrc.c:1245:5: sparse: sparse: symbol 'fsl_easrc_requ=
est_context' was not declared. Should it be static?
   sound/soc/fsl/fsl_easrc.c:1290:6: sparse: sparse: symbol 'fsl_easrc_rele=
ase_context' was not declared. Should it be static?
   sound/soc/fsl/fsl_easrc.c:1317:5: sparse: sparse: symbol 'fsl_easrc_star=
t_context' was not declared. Should it be static?
   sound/soc/fsl/fsl_easrc.c:1335:5: sparse: sparse: symbol 'fsl_easrc_stop=
_context' was not declared. Should it be static?
   sound/soc/fsl/fsl_easrc.c:1474:51: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected unsigned int sample_format @=
@     got restricted snd_pcm_format_t [usertype] format @@
>> sound/soc/fsl/fsl_easrc.c:1474:51: sparse:     expected unsigned int sam=
ple_format
>> sound/soc/fsl/fsl_easrc.c:1474:51: sparse:     got restricted snd_pcm_fo=
rmat_t [usertype] format
   sound/soc/fsl/fsl_easrc.c:1476:52: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected unsigned int sample_format @=
@     got restricted snd_pcm_format_t [usertype] asrc_format @@
   sound/soc/fsl/fsl_easrc.c:1476:52: sparse:     expected unsigned int sam=
ple_format
>> sound/soc/fsl/fsl_easrc.c:1476:52: sparse:     got restricted snd_pcm_fo=
rmat_t [usertype] asrc_format
   sound/soc/fsl/fsl_easrc.c:1479:52: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected unsigned int sample_format @=
@     got restricted snd_pcm_format_t [usertype] format @@
   sound/soc/fsl/fsl_easrc.c:1479:52: sparse:     expected unsigned int sam=
ple_format
   sound/soc/fsl/fsl_easrc.c:1479:52: sparse:     got restricted snd_pcm_fo=
rmat_t [usertype] format
   sound/soc/fsl/fsl_easrc.c:1481:51: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected unsigned int sample_format @=
@     got restricted snd_pcm_format_t [usertype] asrc_format @@
   sound/soc/fsl/fsl_easrc.c:1481:51: sparse:     expected unsigned int sam=
ple_format
   sound/soc/fsl/fsl_easrc.c:1481:51: sparse:     got restricted snd_pcm_fo=
rmat_t [usertype] asrc_format
   sound/soc/fsl/fsl_easrc.c:1493:41: sparse: sparse: incorrect type in arg=
ument 2 (different base types) @@     expected restricted snd_pcm_format_t =
[usertype] *in_raw_format @@     got unsigned int * @@
>> sound/soc/fsl/fsl_easrc.c:1493:41: sparse:     expected restricted snd_p=
cm_format_t [usertype] *in_raw_format
>> sound/soc/fsl/fsl_easrc.c:1493:41: sparse:     got unsigned int *
   sound/soc/fsl/fsl_easrc.c:1494:41: sparse: sparse: incorrect type in arg=
ument 3 (different base types) @@     expected restricted snd_pcm_format_t =
[usertype] *out_raw_format @@     got unsigned int * @@
>> sound/soc/fsl/fsl_easrc.c:1494:41: sparse:     expected restricted snd_p=
cm_format_t [usertype] *out_raw_format
   sound/soc/fsl/fsl_easrc.c:1494:41: sparse:     got unsigned int *
   sound/soc/fsl/fsl_easrc.c:1946:60: sparse: sparse: incorrect type in arg=
ument 3 (different base types) @@     expected unsigned int [usertype] *out=
_value @@     got restricted snd_pcm_format_t * @@
>> sound/soc/fsl/fsl_easrc.c:1946:60: sparse:     expected unsigned int [us=
ertype] *out_value
>> sound/soc/fsl/fsl_easrc.c:1946:60: sparse:     got restricted snd_pcm_fo=
rmat_t *
   sound/soc/fsl/fsl_easrc.c:1952:49: sparse: sparse: restricted snd_pcm_fo=
rmat_t degrades to integer

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3D955ac624058f91172b3b8820280556e699e1e0ff
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git remote update linux-next
git checkout 955ac624058f91172b3b8820280556e699e1e0ff
vim +1474 sound/soc/fsl/fsl_easrc.c

955ac624058f91 Shengjiu Wang 2020-04-16  1284  =

955ac624058f91 Shengjiu Wang 2020-04-16  1285  /*
955ac624058f91 Shengjiu Wang 2020-04-16  1286   * Release the context
955ac624058f91 Shengjiu Wang 2020-04-16  1287   *
955ac624058f91 Shengjiu Wang 2020-04-16  1288   * This funciton is mainly d=
oing the revert thing in request context
955ac624058f91 Shengjiu Wang 2020-04-16  1289   */
955ac624058f91 Shengjiu Wang 2020-04-16 @1290  void fsl_easrc_release_conte=
xt(struct fsl_asrc_pair *ctx)
955ac624058f91 Shengjiu Wang 2020-04-16  1291  {
955ac624058f91 Shengjiu Wang 2020-04-16  1292  	unsigned long lock_flags;
955ac624058f91 Shengjiu Wang 2020-04-16  1293  	struct fsl_asrc *easrc;
955ac624058f91 Shengjiu Wang 2020-04-16  1294  	struct device *dev;
955ac624058f91 Shengjiu Wang 2020-04-16  1295  =

955ac624058f91 Shengjiu Wang 2020-04-16  1296  	if (!ctx)
955ac624058f91 Shengjiu Wang 2020-04-16  1297  		return;
955ac624058f91 Shengjiu Wang 2020-04-16  1298  =

955ac624058f91 Shengjiu Wang 2020-04-16  1299  	easrc =3D ctx->asrc;
955ac624058f91 Shengjiu Wang 2020-04-16  1300  	dev =3D &easrc->pdev->dev;
955ac624058f91 Shengjiu Wang 2020-04-16  1301  =

955ac624058f91 Shengjiu Wang 2020-04-16  1302  	spin_lock_irqsave(&easrc->l=
ock, lock_flags);
955ac624058f91 Shengjiu Wang 2020-04-16  1303  =

955ac624058f91 Shengjiu Wang 2020-04-16  1304  	fsl_easrc_release_slot(easr=
c, ctx->index);
955ac624058f91 Shengjiu Wang 2020-04-16  1305  =

955ac624058f91 Shengjiu Wang 2020-04-16  1306  	easrc->channel_avail +=3D c=
tx->channels;
955ac624058f91 Shengjiu Wang 2020-04-16  1307  	easrc->pair[ctx->index] =3D=
 NULL;
955ac624058f91 Shengjiu Wang 2020-04-16  1308  =

955ac624058f91 Shengjiu Wang 2020-04-16  1309  	spin_unlock_irqrestore(&eas=
rc->lock, lock_flags);
955ac624058f91 Shengjiu Wang 2020-04-16  1310  }
955ac624058f91 Shengjiu Wang 2020-04-16  1311  =

955ac624058f91 Shengjiu Wang 2020-04-16  1312  /*
955ac624058f91 Shengjiu Wang 2020-04-16  1313   * Start the context
955ac624058f91 Shengjiu Wang 2020-04-16  1314   *
955ac624058f91 Shengjiu Wang 2020-04-16  1315   * Enable the DMA request an=
d context
955ac624058f91 Shengjiu Wang 2020-04-16  1316   */
955ac624058f91 Shengjiu Wang 2020-04-16  1317  int fsl_easrc_start_context(=
struct fsl_asrc_pair *ctx)
955ac624058f91 Shengjiu Wang 2020-04-16  1318  {
955ac624058f91 Shengjiu Wang 2020-04-16  1319  	struct fsl_asrc *easrc =3D =
ctx->asrc;
955ac624058f91 Shengjiu Wang 2020-04-16  1320  =

955ac624058f91 Shengjiu Wang 2020-04-16  1321  	regmap_update_bits(easrc->r=
egmap, REG_EASRC_CC(ctx->index),
955ac624058f91 Shengjiu Wang 2020-04-16  1322  			   EASRC_CC_FWMDE_MASK, E=
ASRC_CC_FWMDE);
955ac624058f91 Shengjiu Wang 2020-04-16  1323  	regmap_update_bits(easrc->r=
egmap, REG_EASRC_COC(ctx->index),
955ac624058f91 Shengjiu Wang 2020-04-16  1324  			   EASRC_COC_FWMDE_MASK, =
EASRC_COC_FWMDE);
955ac624058f91 Shengjiu Wang 2020-04-16  1325  	regmap_update_bits(easrc->r=
egmap, REG_EASRC_CC(ctx->index),
955ac624058f91 Shengjiu Wang 2020-04-16  1326  			   EASRC_CC_EN_MASK, EASR=
C_CC_EN);
955ac624058f91 Shengjiu Wang 2020-04-16  1327  	return 0;
955ac624058f91 Shengjiu Wang 2020-04-16  1328  }
955ac624058f91 Shengjiu Wang 2020-04-16  1329  =

955ac624058f91 Shengjiu Wang 2020-04-16  1330  /*
955ac624058f91 Shengjiu Wang 2020-04-16  1331   * Stop the context
955ac624058f91 Shengjiu Wang 2020-04-16  1332   *
955ac624058f91 Shengjiu Wang 2020-04-16  1333   * Disable the DMA request a=
nd context
955ac624058f91 Shengjiu Wang 2020-04-16  1334   */
955ac624058f91 Shengjiu Wang 2020-04-16  1335  int fsl_easrc_stop_context(s=
truct fsl_asrc_pair *ctx)
955ac624058f91 Shengjiu Wang 2020-04-16  1336  {
955ac624058f91 Shengjiu Wang 2020-04-16  1337  	struct fsl_asrc *easrc =3D =
ctx->asrc;
955ac624058f91 Shengjiu Wang 2020-04-16  1338  	int val, i;
955ac624058f91 Shengjiu Wang 2020-04-16  1339  	int size =3D 0;
955ac624058f91 Shengjiu Wang 2020-04-16  1340  	int retry =3D 200;
955ac624058f91 Shengjiu Wang 2020-04-16  1341  =

955ac624058f91 Shengjiu Wang 2020-04-16  1342  	regmap_read(easrc->regmap, =
REG_EASRC_CC(ctx->index), &val);
955ac624058f91 Shengjiu Wang 2020-04-16  1343  =

955ac624058f91 Shengjiu Wang 2020-04-16  1344  	if (val & EASRC_CC_EN_MASK)=
 {
955ac624058f91 Shengjiu Wang 2020-04-16  1345  		regmap_update_bits(easrc->=
regmap,
955ac624058f91 Shengjiu Wang 2020-04-16  1346  				   REG_EASRC_CC(ctx->ind=
ex),
955ac624058f91 Shengjiu Wang 2020-04-16  1347  				   EASRC_CC_STOP_MASK, E=
ASRC_CC_STOP);
955ac624058f91 Shengjiu Wang 2020-04-16  1348  		do {
955ac624058f91 Shengjiu Wang 2020-04-16  1349  			regmap_read(easrc->regmap=
, REG_EASRC_SFS(ctx->index), &val);
955ac624058f91 Shengjiu Wang 2020-04-16  1350  			val &=3D EASRC_SFS_NSGO_M=
ASK;
955ac624058f91 Shengjiu Wang 2020-04-16  1351  			size =3D val >> EASRC_SFS=
_NSGO_SHIFT;
955ac624058f91 Shengjiu Wang 2020-04-16  1352  =

955ac624058f91 Shengjiu Wang 2020-04-16  1353  			/* Read FIFO, drop the da=
ta */
955ac624058f91 Shengjiu Wang 2020-04-16  1354  			for (i =3D 0; i < size * =
ctx->channels; i++)
955ac624058f91 Shengjiu Wang 2020-04-16  1355  				regmap_read(easrc->regma=
p, REG_EASRC_RDFIFO(ctx->index), &val);
955ac624058f91 Shengjiu Wang 2020-04-16  1356  			/* Check RUN_STOP_DONE */
955ac624058f91 Shengjiu Wang 2020-04-16  1357  			regmap_read(easrc->regmap=
, REG_EASRC_IRQF, &val);
955ac624058f91 Shengjiu Wang 2020-04-16  1358  			if (val & EASRC_IRQF_RSD(=
1 << ctx->index)) {
955ac624058f91 Shengjiu Wang 2020-04-16  1359  				/*Clear RUN_STOP_DONE*/
955ac624058f91 Shengjiu Wang 2020-04-16  1360  				regmap_write_bits(easrc-=
>regmap,
955ac624058f91 Shengjiu Wang 2020-04-16  1361  						  REG_EASRC_IRQF,
955ac624058f91 Shengjiu Wang 2020-04-16  1362  						  EASRC_IRQF_RSD(1 << =
ctx->index),
955ac624058f91 Shengjiu Wang 2020-04-16  1363  						  EASRC_IRQF_RSD(1 << =
ctx->index));
955ac624058f91 Shengjiu Wang 2020-04-16  1364  				break;
955ac624058f91 Shengjiu Wang 2020-04-16  1365  			}
955ac624058f91 Shengjiu Wang 2020-04-16  1366  			udelay(100);
955ac624058f91 Shengjiu Wang 2020-04-16  1367  		} while (--retry);
955ac624058f91 Shengjiu Wang 2020-04-16  1368  =

955ac624058f91 Shengjiu Wang 2020-04-16  1369  		if (retry =3D=3D 0)
955ac624058f91 Shengjiu Wang 2020-04-16  1370  			dev_warn(&easrc->pdev->de=
v, "RUN STOP fail\n");
955ac624058f91 Shengjiu Wang 2020-04-16  1371  	}
955ac624058f91 Shengjiu Wang 2020-04-16  1372  =

955ac624058f91 Shengjiu Wang 2020-04-16  1373  	regmap_update_bits(easrc->r=
egmap, REG_EASRC_CC(ctx->index),
955ac624058f91 Shengjiu Wang 2020-04-16  1374  			   EASRC_CC_EN_MASK | EAS=
RC_CC_STOP_MASK, 0);
955ac624058f91 Shengjiu Wang 2020-04-16  1375  	regmap_update_bits(easrc->r=
egmap, REG_EASRC_CC(ctx->index),
955ac624058f91 Shengjiu Wang 2020-04-16  1376  			   EASRC_CC_FWMDE_MASK, 0=
);
955ac624058f91 Shengjiu Wang 2020-04-16  1377  	regmap_update_bits(easrc->r=
egmap, REG_EASRC_COC(ctx->index),
955ac624058f91 Shengjiu Wang 2020-04-16  1378  			   EASRC_COC_FWMDE_MASK, =
0);
955ac624058f91 Shengjiu Wang 2020-04-16  1379  	return 0;
955ac624058f91 Shengjiu Wang 2020-04-16  1380  }
955ac624058f91 Shengjiu Wang 2020-04-16  1381  =

955ac624058f91 Shengjiu Wang 2020-04-16  1382  struct dma_chan *fsl_easrc_g=
et_dma_channel(struct fsl_asrc_pair *ctx,
955ac624058f91 Shengjiu Wang 2020-04-16  1383  					   bool dir)
955ac624058f91 Shengjiu Wang 2020-04-16  1384  {
955ac624058f91 Shengjiu Wang 2020-04-16  1385  	struct fsl_asrc *easrc =3D =
ctx->asrc;
955ac624058f91 Shengjiu Wang 2020-04-16  1386  	enum asrc_pair_index index =
=3D ctx->index;
955ac624058f91 Shengjiu Wang 2020-04-16  1387  	char name[8];
955ac624058f91 Shengjiu Wang 2020-04-16  1388  =

955ac624058f91 Shengjiu Wang 2020-04-16  1389  	/* Example of dma name: ctx=
0_rx */
955ac624058f91 Shengjiu Wang 2020-04-16  1390  	sprintf(name, "ctx%c_%cx", =
index + '0', dir =3D=3D IN ? 'r' : 't');
955ac624058f91 Shengjiu Wang 2020-04-16  1391  =

955ac624058f91 Shengjiu Wang 2020-04-16  1392  	return dma_request_slave_ch=
annel(&easrc->pdev->dev, name);
955ac624058f91 Shengjiu Wang 2020-04-16  1393  };
955ac624058f91 Shengjiu Wang 2020-04-16  1394  EXPORT_SYMBOL_GPL(fsl_easrc_=
get_dma_channel);
955ac624058f91 Shengjiu Wang 2020-04-16  1395  =

955ac624058f91 Shengjiu Wang 2020-04-16  1396  static const unsigned int ea=
src_rates[] =3D {
955ac624058f91 Shengjiu Wang 2020-04-16  1397  	8000, 11025, 12000, 16000,
955ac624058f91 Shengjiu Wang 2020-04-16  1398  	22050, 24000, 32000, 44100,
955ac624058f91 Shengjiu Wang 2020-04-16  1399  	48000, 64000, 88200, 96000,
955ac624058f91 Shengjiu Wang 2020-04-16  1400  	128000, 176400, 192000, 256=
000,
955ac624058f91 Shengjiu Wang 2020-04-16  1401  	352800, 384000, 705600, 768=
000,
955ac624058f91 Shengjiu Wang 2020-04-16  1402  };
955ac624058f91 Shengjiu Wang 2020-04-16  1403  =

955ac624058f91 Shengjiu Wang 2020-04-16  1404  static const struct snd_pcm_=
hw_constraint_list easrc_rate_constraints =3D {
955ac624058f91 Shengjiu Wang 2020-04-16  1405  	.count =3D ARRAY_SIZE(easrc=
_rates),
955ac624058f91 Shengjiu Wang 2020-04-16  1406  	.list =3D easrc_rates,
955ac624058f91 Shengjiu Wang 2020-04-16  1407  };
955ac624058f91 Shengjiu Wang 2020-04-16  1408  =

955ac624058f91 Shengjiu Wang 2020-04-16  1409  static int fsl_easrc_startup=
(struct snd_pcm_substream *substream,
955ac624058f91 Shengjiu Wang 2020-04-16  1410  			     struct snd_soc_dai *=
dai)
955ac624058f91 Shengjiu Wang 2020-04-16  1411  {
955ac624058f91 Shengjiu Wang 2020-04-16  1412  	return snd_pcm_hw_constrain=
t_list(substream->runtime, 0,
955ac624058f91 Shengjiu Wang 2020-04-16  1413  					  SNDRV_PCM_HW_PARAM_RA=
TE,
955ac624058f91 Shengjiu Wang 2020-04-16  1414  					  &easrc_rate_constrain=
ts);
955ac624058f91 Shengjiu Wang 2020-04-16  1415  }
955ac624058f91 Shengjiu Wang 2020-04-16  1416  =

955ac624058f91 Shengjiu Wang 2020-04-16  1417  static int fsl_easrc_trigger=
(struct snd_pcm_substream *substream,
955ac624058f91 Shengjiu Wang 2020-04-16  1418  			     int cmd, struct snd_=
soc_dai *dai)
955ac624058f91 Shengjiu Wang 2020-04-16  1419  {
955ac624058f91 Shengjiu Wang 2020-04-16  1420  	struct snd_pcm_runtime *run=
time =3D substream->runtime;
955ac624058f91 Shengjiu Wang 2020-04-16  1421  	struct fsl_asrc_pair *ctx =
=3D runtime->private_data;
955ac624058f91 Shengjiu Wang 2020-04-16  1422  	int ret;
955ac624058f91 Shengjiu Wang 2020-04-16  1423  =

955ac624058f91 Shengjiu Wang 2020-04-16  1424  	switch (cmd) {
955ac624058f91 Shengjiu Wang 2020-04-16  1425  	case SNDRV_PCM_TRIGGER_STAR=
T:
955ac624058f91 Shengjiu Wang 2020-04-16  1426  	case SNDRV_PCM_TRIGGER_RESU=
ME:
955ac624058f91 Shengjiu Wang 2020-04-16  1427  	case SNDRV_PCM_TRIGGER_PAUS=
E_RELEASE:
955ac624058f91 Shengjiu Wang 2020-04-16  1428  		ret =3D fsl_easrc_start_co=
ntext(ctx);
955ac624058f91 Shengjiu Wang 2020-04-16  1429  		if (ret)
955ac624058f91 Shengjiu Wang 2020-04-16  1430  			return ret;
955ac624058f91 Shengjiu Wang 2020-04-16  1431  		break;
955ac624058f91 Shengjiu Wang 2020-04-16  1432  	case SNDRV_PCM_TRIGGER_STOP:
955ac624058f91 Shengjiu Wang 2020-04-16  1433  	case SNDRV_PCM_TRIGGER_SUSP=
END:
955ac624058f91 Shengjiu Wang 2020-04-16  1434  	case SNDRV_PCM_TRIGGER_PAUS=
E_PUSH:
955ac624058f91 Shengjiu Wang 2020-04-16  1435  		ret =3D fsl_easrc_stop_con=
text(ctx);
955ac624058f91 Shengjiu Wang 2020-04-16  1436  		if (ret)
955ac624058f91 Shengjiu Wang 2020-04-16  1437  			return ret;
955ac624058f91 Shengjiu Wang 2020-04-16  1438  		break;
955ac624058f91 Shengjiu Wang 2020-04-16  1439  	default:
955ac624058f91 Shengjiu Wang 2020-04-16  1440  		return -EINVAL;
955ac624058f91 Shengjiu Wang 2020-04-16  1441  	}
955ac624058f91 Shengjiu Wang 2020-04-16  1442  =

955ac624058f91 Shengjiu Wang 2020-04-16  1443  	return 0;
955ac624058f91 Shengjiu Wang 2020-04-16  1444  }
955ac624058f91 Shengjiu Wang 2020-04-16  1445  =

955ac624058f91 Shengjiu Wang 2020-04-16  1446  static int fsl_easrc_hw_para=
ms(struct snd_pcm_substream *substream,
955ac624058f91 Shengjiu Wang 2020-04-16  1447  			       struct snd_pcm_hw_=
params *params,
955ac624058f91 Shengjiu Wang 2020-04-16  1448  			       struct snd_soc_dai=
 *dai)
955ac624058f91 Shengjiu Wang 2020-04-16  1449  {
955ac624058f91 Shengjiu Wang 2020-04-16  1450  	struct fsl_asrc *easrc =3D =
snd_soc_dai_get_drvdata(dai);
955ac624058f91 Shengjiu Wang 2020-04-16  1451  	struct snd_pcm_runtime *run=
time =3D substream->runtime;
955ac624058f91 Shengjiu Wang 2020-04-16  1452  	struct device *dev =3D &eas=
rc->pdev->dev;
955ac624058f91 Shengjiu Wang 2020-04-16  1453  	struct fsl_asrc_pair *ctx =
=3D runtime->private_data;
955ac624058f91 Shengjiu Wang 2020-04-16  1454  	struct fsl_easrc_ctx_priv *=
ctx_priv =3D ctx->private;
955ac624058f91 Shengjiu Wang 2020-04-16  1455  	unsigned int channels =3D p=
arams_channels(params);
955ac624058f91 Shengjiu Wang 2020-04-16  1456  	unsigned int rate =3D param=
s_rate(params);
955ac624058f91 Shengjiu Wang 2020-04-16  1457  	snd_pcm_format_t format =3D=
 params_format(params);
955ac624058f91 Shengjiu Wang 2020-04-16  1458  	int ret;
955ac624058f91 Shengjiu Wang 2020-04-16  1459  =

955ac624058f91 Shengjiu Wang 2020-04-16  1460  	ret =3D fsl_easrc_request_c=
ontext(channels, ctx);
955ac624058f91 Shengjiu Wang 2020-04-16  1461  	if (ret) {
955ac624058f91 Shengjiu Wang 2020-04-16  1462  		dev_err(dev, "failed to re=
quest context\n");
955ac624058f91 Shengjiu Wang 2020-04-16  1463  		return ret;
955ac624058f91 Shengjiu Wang 2020-04-16  1464  	}
955ac624058f91 Shengjiu Wang 2020-04-16  1465  =

955ac624058f91 Shengjiu Wang 2020-04-16  1466  	ctx_priv->ctx_streams |=3D =
BIT(substream->stream);
955ac624058f91 Shengjiu Wang 2020-04-16  1467  =

955ac624058f91 Shengjiu Wang 2020-04-16  1468  	/*
955ac624058f91 Shengjiu Wang 2020-04-16  1469  	 * Set the input and output=
 ratio so we can compute
955ac624058f91 Shengjiu Wang 2020-04-16  1470  	 * the resampling ratio in =
RS_LOW/HIGH
955ac624058f91 Shengjiu Wang 2020-04-16  1471  	 */
955ac624058f91 Shengjiu Wang 2020-04-16  1472  	if (substream->stream =3D=
=3D SNDRV_PCM_STREAM_PLAYBACK) {
955ac624058f91 Shengjiu Wang 2020-04-16  1473  		ctx_priv->in_params.sample=
_rate =3D rate;
955ac624058f91 Shengjiu Wang 2020-04-16 @1474  		ctx_priv->in_params.sample=
_format =3D format;
955ac624058f91 Shengjiu Wang 2020-04-16  1475  		ctx_priv->out_params.sampl=
e_rate =3D easrc->asrc_rate;
955ac624058f91 Shengjiu Wang 2020-04-16 @1476  		ctx_priv->out_params.sampl=
e_format =3D easrc->asrc_format;
955ac624058f91 Shengjiu Wang 2020-04-16  1477  	} else {
955ac624058f91 Shengjiu Wang 2020-04-16  1478  		ctx_priv->out_params.sampl=
e_rate =3D rate;
955ac624058f91 Shengjiu Wang 2020-04-16 @1479  		ctx_priv->out_params.sampl=
e_format =3D format;
955ac624058f91 Shengjiu Wang 2020-04-16  1480  		ctx_priv->in_params.sample=
_rate =3D easrc->asrc_rate;
955ac624058f91 Shengjiu Wang 2020-04-16 @1481  		ctx_priv->in_params.sample=
_format =3D easrc->asrc_format;
955ac624058f91 Shengjiu Wang 2020-04-16  1482  	}
955ac624058f91 Shengjiu Wang 2020-04-16  1483  =

955ac624058f91 Shengjiu Wang 2020-04-16  1484  	ctx->channels =3D channels;
955ac624058f91 Shengjiu Wang 2020-04-16  1485  	ctx_priv->in_params.fifo_wt=
mk  =3D 0x20;
955ac624058f91 Shengjiu Wang 2020-04-16  1486  	ctx_priv->out_params.fifo_w=
tmk =3D 0x20;
955ac624058f91 Shengjiu Wang 2020-04-16  1487  =

955ac624058f91 Shengjiu Wang 2020-04-16  1488  	/*
955ac624058f91 Shengjiu Wang 2020-04-16  1489  	 * Do only rate conversion =
and keep the same format for input
955ac624058f91 Shengjiu Wang 2020-04-16  1490  	 * and output data
955ac624058f91 Shengjiu Wang 2020-04-16  1491  	 */
955ac624058f91 Shengjiu Wang 2020-04-16  1492  	ret =3D fsl_easrc_set_ctx_f=
ormat(ctx,
955ac624058f91 Shengjiu Wang 2020-04-16 @1493  				       &ctx_priv->in_par=
ams.sample_format,
955ac624058f91 Shengjiu Wang 2020-04-16 @1494  				       &ctx_priv->out_pa=
rams.sample_format);
955ac624058f91 Shengjiu Wang 2020-04-16  1495  	if (ret) {
955ac624058f91 Shengjiu Wang 2020-04-16  1496  		dev_err(dev, "failed to se=
t format %d", ret);
955ac624058f91 Shengjiu Wang 2020-04-16  1497  		return ret;
955ac624058f91 Shengjiu Wang 2020-04-16  1498  	}
955ac624058f91 Shengjiu Wang 2020-04-16  1499  =

955ac624058f91 Shengjiu Wang 2020-04-16  1500  	ret =3D fsl_easrc_config_co=
ntext(easrc, ctx->index);
955ac624058f91 Shengjiu Wang 2020-04-16  1501  	if (ret) {
955ac624058f91 Shengjiu Wang 2020-04-16  1502  		dev_err(dev, "failed to co=
nfig context\n");
955ac624058f91 Shengjiu Wang 2020-04-16  1503  		return ret;
955ac624058f91 Shengjiu Wang 2020-04-16  1504  	}
955ac624058f91 Shengjiu Wang 2020-04-16  1505  =

955ac624058f91 Shengjiu Wang 2020-04-16  1506  	ctx_priv->in_params.iterati=
ons =3D 1;
955ac624058f91 Shengjiu Wang 2020-04-16  1507  	ctx_priv->in_params.group_l=
en =3D ctx->channels;
955ac624058f91 Shengjiu Wang 2020-04-16  1508  	ctx_priv->in_params.access_=
len =3D ctx->channels;
955ac624058f91 Shengjiu Wang 2020-04-16  1509  	ctx_priv->out_params.iterat=
ions =3D 1;
955ac624058f91 Shengjiu Wang 2020-04-16  1510  	ctx_priv->out_params.group_=
len =3D ctx->channels;
955ac624058f91 Shengjiu Wang 2020-04-16  1511  	ctx_priv->out_params.access=
_len =3D ctx->channels;
955ac624058f91 Shengjiu Wang 2020-04-16  1512  =

955ac624058f91 Shengjiu Wang 2020-04-16  1513  	ret =3D fsl_easrc_set_ctx_o=
rganziation(ctx);
955ac624058f91 Shengjiu Wang 2020-04-16  1514  	if (ret) {
955ac624058f91 Shengjiu Wang 2020-04-16  1515  		dev_err(dev, "failed to se=
t fifo organization\n");
955ac624058f91 Shengjiu Wang 2020-04-16  1516  		return ret;
955ac624058f91 Shengjiu Wang 2020-04-16  1517  	}
955ac624058f91 Shengjiu Wang 2020-04-16  1518  =

955ac624058f91 Shengjiu Wang 2020-04-16  1519  	return 0;
955ac624058f91 Shengjiu Wang 2020-04-16  1520  }
955ac624058f91 Shengjiu Wang 2020-04-16  1521  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1252837964785851956==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1252837964785851956==--

