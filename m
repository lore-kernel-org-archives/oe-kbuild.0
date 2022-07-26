Content-Type: multipart/mixed; boundary="===============6871527684406780308=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/sof/topology.c:1780 sof_route_load() warn: missing error code 'ret'
Date: Wed, 27 Jul 2022 04:40:25 +0800
Message-ID: <202207270447.E88xIjsF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6871527684406780308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>
CC: "P=C3=A9ter Ujfalusi" <peter.ujfalusi@linux.intel.com>
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>
CC: Bard Liao <yung-chuan.liao@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5de64d44968e4ae66ebdb0a2d08b443f189d3651
commit: 31cd6e469364c42c9c929750991c51e83a95e80b ASoC: SOF: topology: Add o=
ps for setting up and tearing down pipelines
date:   4 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 months ago
config: openrisc-randconfig-m041-20220721 (https://download.01.org/0day-ci/=
archive/20220727/202207270447.E88xIjsF-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
sound/soc/sof/topology.c:1780 sof_route_load() warn: missing error code 're=
t'

Old smatch warnings:
sound/soc/sof/topology.c:908 sof_control_load() warn: possible memory leak =
of 'scontrol'

vim +/ret +1780 sound/soc/sof/topology.c

909dadf21aae8f Ranjani Sridharan     2022-03-14  1742  =

311ce4fe7637d9 Liam Girdwood         2019-04-12  1743  /* DAI link - used f=
or any driver specific init */
311ce4fe7637d9 Liam Girdwood         2019-04-12  1744  static int sof_route=
_load(struct snd_soc_component *scomp, int index,
311ce4fe7637d9 Liam Girdwood         2019-04-12  1745  			  struct snd_soc_=
dapm_route *route)
311ce4fe7637d9 Liam Girdwood         2019-04-12  1746  {
311ce4fe7637d9 Liam Girdwood         2019-04-12  1747  	struct snd_sof_dev =
*sdev =3D snd_soc_component_get_drvdata(scomp);
311ce4fe7637d9 Liam Girdwood         2019-04-12  1748  	struct snd_sof_widg=
et *source_swidget, *sink_swidget;
311ce4fe7637d9 Liam Girdwood         2019-04-12  1749  	struct snd_soc_dobj=
 *dobj =3D &route->dobj;
311ce4fe7637d9 Liam Girdwood         2019-04-12  1750  	struct snd_sof_rout=
e *sroute;
311ce4fe7637d9 Liam Girdwood         2019-04-12  1751  	int ret =3D 0;
311ce4fe7637d9 Liam Girdwood         2019-04-12  1752  =

311ce4fe7637d9 Liam Girdwood         2019-04-12  1753  	/* allocate memory =
for sroute and connect */
311ce4fe7637d9 Liam Girdwood         2019-04-12  1754  	sroute =3D kzalloc(=
sizeof(*sroute), GFP_KERNEL);
311ce4fe7637d9 Liam Girdwood         2019-04-12  1755  	if (!sroute)
311ce4fe7637d9 Liam Girdwood         2019-04-12  1756  		return -ENOMEM;
311ce4fe7637d9 Liam Girdwood         2019-04-12  1757  =

ee1e79b72e3cf5 Ranjani Sridharan     2019-12-04  1758  	sroute->scomp =3D s=
comp;
ee1e79b72e3cf5 Ranjani Sridharan     2019-12-04  1759  	dev_dbg(scomp->dev,=
 "sink %s control %s source %s\n",
311ce4fe7637d9 Liam Girdwood         2019-04-12  1760  		route->sink, route=
->control ? route->control : "none",
311ce4fe7637d9 Liam Girdwood         2019-04-12  1761  		route->source);
311ce4fe7637d9 Liam Girdwood         2019-04-12  1762  =

311ce4fe7637d9 Liam Girdwood         2019-04-12  1763  	/* source component=
 */
ee1e79b72e3cf5 Ranjani Sridharan     2019-12-04  1764  	source_swidget =3D =
snd_sof_find_swidget(scomp, (char *)route->source);
311ce4fe7637d9 Liam Girdwood         2019-04-12  1765  	if (!source_swidget=
) {
ee1e79b72e3cf5 Ranjani Sridharan     2019-12-04  1766  		dev_err(scomp->dev=
, "error: source %s not found\n",
311ce4fe7637d9 Liam Girdwood         2019-04-12  1767  			route->source);
311ce4fe7637d9 Liam Girdwood         2019-04-12  1768  		ret =3D -EINVAL;
311ce4fe7637d9 Liam Girdwood         2019-04-12  1769  		goto err;
311ce4fe7637d9 Liam Girdwood         2019-04-12  1770  	}
311ce4fe7637d9 Liam Girdwood         2019-04-12  1771  =

311ce4fe7637d9 Liam Girdwood         2019-04-12  1772  	/*
311ce4fe7637d9 Liam Girdwood         2019-04-12  1773  	 * Virtual widgets =
of type output/out_drv may be added in topology
311ce4fe7637d9 Liam Girdwood         2019-04-12  1774  	 * for compatibilit=
y. These are not handled by the FW.
311ce4fe7637d9 Liam Girdwood         2019-04-12  1775  	 * So, don't send r=
outes whose source/sink widget is of such types
311ce4fe7637d9 Liam Girdwood         2019-04-12  1776  	 * to the DSP.
311ce4fe7637d9 Liam Girdwood         2019-04-12  1777  	 */
311ce4fe7637d9 Liam Girdwood         2019-04-12  1778  	if (source_swidget-=
>id =3D=3D snd_soc_dapm_out_drv ||
311ce4fe7637d9 Liam Girdwood         2019-04-12  1779  	    source_swidget-=
>id =3D=3D snd_soc_dapm_output)
311ce4fe7637d9 Liam Girdwood         2019-04-12 @1780  		goto err;
311ce4fe7637d9 Liam Girdwood         2019-04-12  1781  =

311ce4fe7637d9 Liam Girdwood         2019-04-12  1782  	/* sink component */
ee1e79b72e3cf5 Ranjani Sridharan     2019-12-04  1783  	sink_swidget =3D sn=
d_sof_find_swidget(scomp, (char *)route->sink);
311ce4fe7637d9 Liam Girdwood         2019-04-12  1784  	if (!sink_swidget) {
ee1e79b72e3cf5 Ranjani Sridharan     2019-12-04  1785  		dev_err(scomp->dev=
, "error: sink %s not found\n",
311ce4fe7637d9 Liam Girdwood         2019-04-12  1786  			route->sink);
311ce4fe7637d9 Liam Girdwood         2019-04-12  1787  		ret =3D -EINVAL;
311ce4fe7637d9 Liam Girdwood         2019-04-12  1788  		goto err;
311ce4fe7637d9 Liam Girdwood         2019-04-12  1789  	}
311ce4fe7637d9 Liam Girdwood         2019-04-12  1790  =

311ce4fe7637d9 Liam Girdwood         2019-04-12  1791  	/*
311ce4fe7637d9 Liam Girdwood         2019-04-12  1792  	 * Don't send route=
s whose sink widget is of type
311ce4fe7637d9 Liam Girdwood         2019-04-12  1793  	 * output or out_dr=
v to the DSP
311ce4fe7637d9 Liam Girdwood         2019-04-12  1794  	 */
311ce4fe7637d9 Liam Girdwood         2019-04-12  1795  	if (sink_swidget->i=
d =3D=3D snd_soc_dapm_out_drv ||
311ce4fe7637d9 Liam Girdwood         2019-04-12  1796  	    sink_swidget->i=
d =3D=3D snd_soc_dapm_output)
311ce4fe7637d9 Liam Girdwood         2019-04-12  1797  		goto err;
311ce4fe7637d9 Liam Girdwood         2019-04-12  1798  =

311ce4fe7637d9 Liam Girdwood         2019-04-12  1799  	sroute->route =3D r=
oute;
311ce4fe7637d9 Liam Girdwood         2019-04-12  1800  	dobj->private =3D s=
route;
0a2dea1f101067 Ranjani Sridharan     2021-09-27  1801  	sroute->src_widget =
=3D source_swidget;
0a2dea1f101067 Ranjani Sridharan     2021-09-27  1802  	sroute->sink_widget=
 =3D sink_swidget;
311ce4fe7637d9 Liam Girdwood         2019-04-12  1803  =

311ce4fe7637d9 Liam Girdwood         2019-04-12  1804  	/* add route to rou=
te list */
311ce4fe7637d9 Liam Girdwood         2019-04-12  1805  	list_add(&sroute->l=
ist, &sdev->route_list);
311ce4fe7637d9 Liam Girdwood         2019-04-12  1806  =

b9f8e1387cf0c9 Guennadi Liakhovetski 2020-09-17  1807  	return 0;
311ce4fe7637d9 Liam Girdwood         2019-04-12  1808  err:
311ce4fe7637d9 Liam Girdwood         2019-04-12  1809  	kfree(sroute);
311ce4fe7637d9 Liam Girdwood         2019-04-12  1810  	return ret;
311ce4fe7637d9 Liam Girdwood         2019-04-12  1811  }
311ce4fe7637d9 Liam Girdwood         2019-04-12  1812  =


:::::: The code at line 1780 was first introduced by commit
:::::: 311ce4fe7637d96608b6e57bf9ebbd8aabcf429e ASoC: SOF: Add support for =
loading topologies

:::::: TO: Liam Girdwood <liam.r.girdwood@linux.intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6871527684406780308==--

