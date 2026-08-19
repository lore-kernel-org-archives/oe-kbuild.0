Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99CB3A5435
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Aug 2026 21:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787176334; cv=none; b=bNou7aIAv9/V+YYHQ5dnDejM9LWS3R5620/rXhiOULgHDvCfJaygDHtP26Ti9eCDR9XvYZ5OkL7Vgi1noDhpJD+McVavmQOVGROKkzzhMwwfPxYyLaqMJ13RTVyHf35LRDT17pqZ1uXJCPKyFdwrf3iGUJNtNWeuYFOFcKz1fb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787176334; c=relaxed/simple;
	bh=sZhAaP9DZpkdngqBQDQXfXWwsGiBmJAf9bw7Jsa0eNY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LTez7Adq3N4Zp1ir5PLGWaQ2Han7JZry/RxqsP5cpakrw1bjcyQpNsyLDspFKcxC32L/69vYyPpYuSQgeZYbDx/O+BTQB1Hy3cJ9gQe4MO8AXoj9BBZNlSX8wzAvimaov8D7tRk3PcF4yoIC8DUTIUKmlaYXq8Wp+j7+FAtwxig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g+dg4zdl; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g+dg4zdl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787176332; x=1818712332;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sZhAaP9DZpkdngqBQDQXfXWwsGiBmJAf9bw7Jsa0eNY=;
  b=g+dg4zdliEyUYfYD5lDU/4AnneBnpqqkw1SXLlytboE6V5WjFD6R5Ow7
   /pVO4z8WXjS5XRInYMyVcwBLE/ukreEba3wa3iJOBe2LwRwDti7dgsq2Z
   QGba62ZaLI2AbcMdgErISnJTaDdI/UNQ2z/E0OEV5P+QZA576oG992Zb/
   3eE2Nm3nVjLWUXMQ/QVR5IzDAz7+dcD4gYu3N4REdwseyfF+y2WBstuhP
   6Xcqg/Sw+7PRFUfNvJdR4DRxJPpQx3+n9f7YFr9GhBy0J585NdSVW2r8g
   pDNlev7NuOxcHV3xOrabfdTZJ19L1AgoofWR+cDwsNfGQSi813EmyDbxl
   Q==;
X-CSE-ConnectionGUID: rV9gHaWtRAqH5JyzuKu6lw==
X-CSE-MsgGUID: b+K1tncEQ6m2E4GTWpMjug==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="91514714"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="91514714"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 14:52:11 -0700
X-CSE-ConnectionGUID: 0V4fWYc7S5atOP/0Z/B0xg==
X-CSE-MsgGUID: mhT+i0SzSn28Z/Euz3tYjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="269531295"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Aug 2026 14:52:09 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwoCd-00000000gaj-16ZH;
	Wed, 19 Aug 2026 21:52:07 +0000
Date: Thu, 20 Aug 2026 05:51:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 13696/16300]
 sound/soc/sof/topology.c:2647 snd_sof_load_topology() warn: 'fw' from
 request_firmware() not released on lines: 2647.
Message-ID: <202608200503.WtcPUVdp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Takashi Iwai <tiwai@suse.de>
CC: Mark Brown <broonie@kernel.org>

Hi Takashi,

FYI, the error/warning was bisected to this commit, please ignore it if it'=
s irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   6a746cd265aed59107ebdaa9ce039bb832922969
commit: 6d0a9e4df17979ef8acbf8d7d6145fb1375e45cd [13696/16300] ASoC: SOF: U=
se auto-cleanup for firmware loading
:::::: branch date: 9 hours ago
:::::: commit date: 9 days ago
config: x86_64-randconfig-161-20260820 (https://download.01.org/0day-ci/arc=
hive/20260820/202608200503.WtcPUVdp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 6d0a9e4df179 ("ASoC: SOF: Use auto-cleanup for firmware loading")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608200503.WtcPUVdp-lkp@intel.com/

New smatch warnings:
sound/soc/sof/topology.c:2647 snd_sof_load_topology() warn: 'fw' from reque=
st_firmware() not released on lines: 2647.
sound/soc/sof/topology.c:2647 snd_sof_load_topology() warn: 'fw' from reque=
st_firmware() not released on lines: 2647.

Old smatch warnings:
sound/soc/sof/topology.c:2133 sof_route_load() warn: missing error code 're=
t'

vim +/fw +2647 sound/soc/sof/topology.c

28d40e7adfd410 Peter Ujfalusi     2023-04-04  2503 =20
ee1e79b72e3cf5 Ranjani Sridharan  2019-12-04  2504  int snd_sof_load_topolo=
gy(struct snd_soc_component *scomp, const char *file)
311ce4fe7637d9 Liam Girdwood      2019-04-12  2505  {
9b014266ef8ad0 Jaroslav Kysela    2022-03-29  2506  	struct snd_sof_dev *sd=
ev =3D snd_soc_component_get_drvdata(scomp);
6d5997c412cc4b Bard Liao          2025-04-14  2507  	struct snd_sof_pdata *=
sof_pdata =3D sdev->pdata;
6d5997c412cc4b Bard Liao          2025-04-14  2508  	const char *tplg_filen=
ame_prefix =3D sof_pdata->tplg_filename_prefix;
6d5997c412cc4b Bard Liao          2025-04-14  2509  	int tplg_cnt =3D 0;
311ce4fe7637d9 Liam Girdwood      2019-04-12  2510  	int ret;
6d5997c412cc4b Bard Liao          2025-04-14  2511  	int i;
311ce4fe7637d9 Liam Girdwood      2019-04-12  2512 =20
6d0a9e4df17979 Takashi Iwai       2026-08-06  2513  	const char **tplg_file=
s __free(kfree) =3D
6d0a9e4df17979 Takashi Iwai       2026-08-06  2514  		kcalloc(scomp->card->=
num_links, sizeof(char *), GFP_KERNEL);
6d5997c412cc4b Bard Liao          2025-04-14  2515  	if (!tplg_files)
6d5997c412cc4b Bard Liao          2025-04-14  2516  		return -ENOMEM;
6d5997c412cc4b Bard Liao          2025-04-14  2517 =20
c8f3c9fa75ff38 Peter Ujfalusi     2025-12-15  2518  	/* Try to use function=
 topologies if possible */
7b400c9ab879a8 Bard Liao          2025-05-06  2519  	if (!sof_pdata->disabl=
e_function_topology && !disable_function_topology &&
7b400c9ab879a8 Bard Liao          2025-05-06  2520  	    sof_pdata->machine=
 && sof_pdata->machine->get_function_tplg_files) {
c8f3c9fa75ff38 Peter Ujfalusi     2025-12-15  2521  		/*
c8f3c9fa75ff38 Peter Ujfalusi     2025-12-15  2522  		 * When the topology =
name contains 'dummy' word, it means that
c8f3c9fa75ff38 Peter Ujfalusi     2025-12-15  2523  		 * there is no fallba=
ck option to monolithic topology in case
c8f3c9fa75ff38 Peter Ujfalusi     2025-12-15  2524  		 * any of the functio=
n topologies might be missing.
c8f3c9fa75ff38 Peter Ujfalusi     2025-12-15  2525  		 * In this case we sh=
ould use best effort to form the card,
c8f3c9fa75ff38 Peter Ujfalusi     2025-12-15  2526  		 * ignoring functiona=
lities that we are missing a fragment for.
c8f3c9fa75ff38 Peter Ujfalusi     2025-12-15  2527  		 *
c8f3c9fa75ff38 Peter Ujfalusi     2025-12-15  2528  		 * Note: monolithic t=
opologies also ignore these possibly
c8f3c9fa75ff38 Peter Ujfalusi     2025-12-15  2529  		 * missing functions,=
 so the functionality of the card would be
c8f3c9fa75ff38 Peter Ujfalusi     2025-12-15  2530  		 * identical to the c=
ase if there would be a fallback monolithic
c8f3c9fa75ff38 Peter Ujfalusi     2025-12-15  2531  		 * topology created f=
or the configuration.
c8f3c9fa75ff38 Peter Ujfalusi     2025-12-15  2532  		 */
c8f3c9fa75ff38 Peter Ujfalusi     2025-12-15  2533  		bool no_fallback =3D =
strstr(file, "dummy");
c8f3c9fa75ff38 Peter Ujfalusi     2025-12-15  2534 =20
6d5997c412cc4b Bard Liao          2025-04-14  2535  		tplg_cnt =3D sof_pdat=
a->machine->get_function_tplg_files(scomp->card,
6d5997c412cc4b Bard Liao          2025-04-14  2536  								       sof_pdat=
a->machine,
6d5997c412cc4b Bard Liao          2025-04-14  2537  								       tplg_fil=
ename_prefix,
c8f3c9fa75ff38 Peter Ujfalusi     2025-12-15  2538  								       &tplg_fi=
les,
c8f3c9fa75ff38 Peter Ujfalusi     2025-12-15  2539  								       no_fallb=
ack);
6d0a9e4df17979 Takashi Iwai       2026-08-06  2540  		if (tplg_cnt < 0)
6d5997c412cc4b Bard Liao          2025-04-14  2541  			return tplg_cnt;
6d5997c412cc4b Bard Liao          2025-04-14  2542  	}
6d5997c412cc4b Bard Liao          2025-04-14  2543 =20
6d5997c412cc4b Bard Liao          2025-04-14  2544  	/*
6d5997c412cc4b Bard Liao          2025-04-14  2545  	 * The monolithic topo=
logy will be used if there is no get_function_tplg_files
6d5997c412cc4b Bard Liao          2025-04-14  2546  	 * callback or the cal=
lback returns 0.
6d5997c412cc4b Bard Liao          2025-04-14  2547  	 */
6d5997c412cc4b Bard Liao          2025-04-14  2548  	if (!tplg_cnt) {
99c159279c6dfa Bard Liao          2025-10-09  2549  		if (strstr(file, "dum=
my")) {
99c159279c6dfa Bard Liao          2025-10-09  2550  			dev_err(scomp->dev,
99c159279c6dfa Bard Liao          2025-10-09  2551  				"Function topology =
is required, please upgrade sof-firmware\n");
99c159279c6dfa Bard Liao          2025-10-09  2552  			return -EINVAL;
99c159279c6dfa Bard Liao          2025-10-09  2553  		}
6d5997c412cc4b Bard Liao          2025-04-14  2554  		tplg_files[0] =3D fil=
e;
6d5997c412cc4b Bard Liao          2025-04-14  2555  		tplg_cnt =3D 1;
2b92b98cc4765f Bard Liao          2025-10-09  2556  		dev_info(scomp->dev, =
"loading topology: %s\n", file);
6d5997c412cc4b Bard Liao          2025-04-14  2557  	} else {
6d5997c412cc4b Bard Liao          2025-04-14  2558  		dev_info(scomp->dev, =
"Using function topologies instead %s\n", file);
6d5997c412cc4b Bard Liao          2025-04-14  2559  	}
6d5997c412cc4b Bard Liao          2025-04-14  2560 =20
6d5997c412cc4b Bard Liao          2025-04-14  2561  	for (i =3D 0; i < tplg=
_cnt; i++) {
6d5997c412cc4b Bard Liao          2025-04-14  2562  		/* Only print the fil=
e names if the function topologies are used */
6d5997c412cc4b Bard Liao          2025-04-14  2563  		if (tplg_files[0] !=
=3D file)
6d5997c412cc4b Bard Liao          2025-04-14  2564  			dev_info(scomp->dev,=
 "loading topology %d: %s\n", i, tplg_files[i]);
311ce4fe7637d9 Liam Girdwood      2019-04-12  2565 =20
6d0a9e4df17979 Takashi Iwai       2026-08-06  2566  		const struct firmware=
 *fw __free(firmware) =3D NULL;
6d5997c412cc4b Bard Liao          2025-04-14  2567  		ret =3D request_firmw=
are(&fw, tplg_files[i], scomp->dev);
311ce4fe7637d9 Liam Girdwood      2019-04-12  2568  		if (ret < 0) {
6d5997c412cc4b Bard Liao          2025-04-14  2569  			/*
6d5997c412cc4b Bard Liao          2025-04-14  2570  			 * snd_soc_tplg_comp=
onent_remove(scomp) will be called
6d5997c412cc4b Bard Liao          2025-04-14  2571  			 * if snd_soc_tplg_c=
omponent_load(scomp) failed and all
6d5997c412cc4b Bard Liao          2025-04-14  2572  			 * objects in the sc=
omp will be removed. No need to call
6d5997c412cc4b Bard Liao          2025-04-14  2573  			 * snd_soc_tplg_comp=
onent_remove(scomp) here.
6d5997c412cc4b Bard Liao          2025-04-14  2574  			 */
6d5997c412cc4b Bard Liao          2025-04-14  2575  			dev_err(scomp->dev, =
"tplg request firmware %s failed err: %d\n",
6d5997c412cc4b Bard Liao          2025-04-14  2576  				tplg_files[i], ret);
6d5997c412cc4b Bard Liao          2025-04-14  2577  			goto out;
311ce4fe7637d9 Liam Girdwood      2019-04-12  2578  		}
311ce4fe7637d9 Liam Girdwood      2019-04-12  2579 =20
28d40e7adfd410 Peter Ujfalusi     2023-04-04  2580  		if (sdev->dspless_mod=
e_selected)
28d40e7adfd410 Peter Ujfalusi     2023-04-04  2581  			ret =3D snd_soc_tplg=
_component_load(scomp, &sof_dspless_tplg_ops, fw);
28d40e7adfd410 Peter Ujfalusi     2023-04-04  2582  		else
a5b8f71c5477f4 Amadeusz S=C5=82awi=C5=84ski 2020-10-30  2583  			ret =3D sn=
d_soc_tplg_component_load(scomp, &sof_tplg_ops, fw);
28d40e7adfd410 Peter Ujfalusi     2023-04-04  2584 =20
6d5997c412cc4b Bard Liao          2025-04-14  2585  		if (ret < 0) {
6d5997c412cc4b Bard Liao          2025-04-14  2586  			dev_err(scomp->dev, =
"tplg %s component load failed %d\n",
6d5997c412cc4b Bard Liao          2025-04-14  2587  				tplg_files[i], ret);
6d5997c412cc4b Bard Liao          2025-04-14  2588  			goto out;
6d5997c412cc4b Bard Liao          2025-04-14  2589  		}
6d5997c412cc4b Bard Liao          2025-04-14  2590  	}
6d5997c412cc4b Bard Liao          2025-04-14  2591 =20
d82bf6af621301 Bard Liao          2026-04-21  2592  	/* Loading user define=
d topologies */
d82bf6af621301 Bard Liao          2026-04-21  2593  	for (i =3D 0; i < feat=
ure_tplg_cnt; i++) {
d82bf6af621301 Bard Liao          2026-04-21  2594  		const char *feature_t=
opology =3D devm_kasprintf(scomp->dev, GFP_KERNEL, "%s/%s",
d82bf6af621301 Bard Liao          2026-04-21  2595  							   tplg_filename=
_prefix,
d82bf6af621301 Bard Liao          2026-04-21  2596  							   feature_topol=
ogies[i]);
d82bf6af621301 Bard Liao          2026-04-21  2597 =20
d82bf6af621301 Bard Liao          2026-04-21  2598  		if (!feature_topology=
) {
d82bf6af621301 Bard Liao          2026-04-21  2599  			ret =3D -ENOMEM;
d82bf6af621301 Bard Liao          2026-04-21  2600  			goto out;
d82bf6af621301 Bard Liao          2026-04-21  2601  		}
d82bf6af621301 Bard Liao          2026-04-21  2602  		dev_info(scomp->dev, =
"loading feature topology %d: %s\n", i, feature_topology);
6d0a9e4df17979 Takashi Iwai       2026-08-06  2603 =20
6d0a9e4df17979 Takashi Iwai       2026-08-06  2604  		const struct firmware=
 *fw __free(firmware) =3D NULL;
d82bf6af621301 Bard Liao          2026-04-21  2605  		ret =3D request_firmw=
are(&fw, feature_topology, scomp->dev);
d82bf6af621301 Bard Liao          2026-04-21  2606  		if (ret < 0) {
d82bf6af621301 Bard Liao          2026-04-21  2607  			/*
d82bf6af621301 Bard Liao          2026-04-21  2608  			 * snd_soc_tplg_comp=
onent_remove(scomp) will be called
d82bf6af621301 Bard Liao          2026-04-21  2609  			 * if snd_soc_tplg_c=
omponent_load(scomp) failed and all
d82bf6af621301 Bard Liao          2026-04-21  2610  			 * objects in the sc=
omp will be removed. No need to call
d82bf6af621301 Bard Liao          2026-04-21  2611  			 * snd_soc_tplg_comp=
onent_remove(scomp) here.
d82bf6af621301 Bard Liao          2026-04-21  2612  			 */
d82bf6af621301 Bard Liao          2026-04-21  2613  			dev_warn(scomp->dev,=
 "feature tplg request firmware %s failed err: %d\n",
d82bf6af621301 Bard Liao          2026-04-21  2614  				 feature_topologies=
[i], ret);
d82bf6af621301 Bard Liao          2026-04-21  2615  			/*
d82bf6af621301 Bard Liao          2026-04-21  2616  			 * We don't return e=
rror here because we can still have the basic
d82bf6af621301 Bard Liao          2026-04-21  2617  			 * audio feature whe=
n the function topology load complete. No need
d82bf6af621301 Bard Liao          2026-04-21  2618  			 * to convert the er=
ror code because we will get new 'ret' out of the
d82bf6af621301 Bard Liao          2026-04-21  2619  			 * loop.
d82bf6af621301 Bard Liao          2026-04-21  2620  			 */
d82bf6af621301 Bard Liao          2026-04-21  2621  			continue;
d82bf6af621301 Bard Liao          2026-04-21  2622  		}
d82bf6af621301 Bard Liao          2026-04-21  2623 =20
d82bf6af621301 Bard Liao          2026-04-21  2624  		if (sdev->dspless_mod=
e_selected)
d82bf6af621301 Bard Liao          2026-04-21  2625  			ret =3D snd_soc_tplg=
_component_load(scomp, &sof_dspless_tplg_ops, fw);
d82bf6af621301 Bard Liao          2026-04-21  2626  		else
d82bf6af621301 Bard Liao          2026-04-21  2627  			ret =3D snd_soc_tplg=
_component_load(scomp, &sof_tplg_ops, fw);
d82bf6af621301 Bard Liao          2026-04-21  2628 =20
d82bf6af621301 Bard Liao          2026-04-21  2629  		if (ret < 0) {
d82bf6af621301 Bard Liao          2026-04-21  2630  			dev_err(scomp->dev, =
"feature tplg %s component load failed %d\n",
d82bf6af621301 Bard Liao          2026-04-21  2631  				feature_topologies[=
i], ret);
d82bf6af621301 Bard Liao          2026-04-21  2632  			/*
d82bf6af621301 Bard Liao          2026-04-21  2633  			 * We need to return=
 error here because it may lead to kernel NULL pointer
d82bf6af621301 Bard Liao          2026-04-21  2634  			 * dereference if we=
 continue the remaining tasks.
d82bf6af621301 Bard Liao          2026-04-21  2635  			 */
d82bf6af621301 Bard Liao          2026-04-21  2636  			goto out;
d82bf6af621301 Bard Liao          2026-04-21  2637  		}
d82bf6af621301 Bard Liao          2026-04-21  2638  	}
d82bf6af621301 Bard Liao          2026-04-21  2639 =20
6d5997c412cc4b Bard Liao          2025-04-14  2640  	/* call sof_complete w=
hen topologies are loaded successfully */
6d5997c412cc4b Bard Liao          2025-04-14  2641  	ret =3D sof_complete(s=
comp);
6d5997c412cc4b Bard Liao          2025-04-14  2642 =20
6d5997c412cc4b Bard Liao          2025-04-14  2643  out:
9b014266ef8ad0 Jaroslav Kysela    2022-03-29  2644  	if (ret >=3D 0 && sdev=
->led_present)
9b014266ef8ad0 Jaroslav Kysela    2022-03-29  2645  		ret =3D snd_ctl_led_r=
equest();
9b014266ef8ad0 Jaroslav Kysela    2022-03-29  2646 =20
311ce4fe7637d9 Liam Girdwood      2019-04-12 @2647  	return ret;

:::::: The code at line 2647 was first introduced by commit
:::::: 311ce4fe7637d96608b6e57bf9ebbd8aabcf429e ASoC: SOF: Add support for =
loading topologies

:::::: TO: Liam Girdwood <liam.r.girdwood@linux.intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
