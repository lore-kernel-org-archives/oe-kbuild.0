Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FE1445AFE
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Oct 2026 07:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309966; cv=none; b=P9HJlfava74YTUIpMBDaEZq6TqwEjg16gbgl3Nj6KGsH4oD7e8qC6FB56Rb/z24n7/ALljIlAPmWHkbaVhghsJHTdmDK901mQ/EUVC77IRuO5u7nzHdPH549fsVi5as80fUOEYFvyrmuVJPWnDSvM8+kubN6QVKpmvfeL0ZnK7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309966; c=relaxed/simple;
	bh=uui7TCbn+iykjliDgQcRsQP0EtgHiZpssL98o0Wvymg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RayoaLUP+Tm/gj2Us99371zAe7Yvj41Z/ljx0Kd5bwWrbpAVUGPOcrMofHyAJD00CMAQLDG+uHDhw90BeHJ+oLCUmOkVNU1O2ByGbb4Crgsj8CsvHDh9UEHm0GpTh6MWBwftTDN4q2ec1pOLpTE1B4e/3mlTcERX4CuNBRMv0ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cyPsJ7hI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cyPsJ7hI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792309962; x=1823845962;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uui7TCbn+iykjliDgQcRsQP0EtgHiZpssL98o0Wvymg=;
  b=cyPsJ7hIa9fJBi1VY1iBU85db+NSUfmicAXk4SWOyMOXHYIL+GRAk1j+
   +8nYSMr9LdpUcOWuO4C4Q2sdo9gXJkXaMfk5f91zWewoTkY3kgZBzpZEk
   JFQLALcosAeiD3Q5y/kCBsyPcGS41/T8MNBtCpEGi3su1oZi9dl98MoGc
   +9KZh4b/yx8VSNnzjEt34YI0NCsic24CYvRG1n2v7EhRQXS/J1piq3er5
   +RRU9ZohsTz/Xc1b6LK+KuZj7subEOYs48JTz46t8P9J0eu7UkEr6ZFbi
   ZbyQOOWO2b+U3+k/IaLGUUOMdGLvvw9EwfMyR7cJ9E8n+sP6DarlhEXLk
   w==;
X-CSE-ConnectionGUID: 6EUB+DVhTbGuJs0V4zNqAA==
X-CSE-MsgGUID: NTlFKXHDT1eti3e3+H71pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="916679"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="916679"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:52:35 -0700
X-CSE-ConnectionGUID: LQC5H2/GSR2gRRigo1qxIA==
X-CSE-MsgGUID: Gr+gpIUSSU+Qp1X73gLBfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="2340782"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 18 Oct 2026 00:52:33 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILh1-000000004vp-3VBE;
	Sun, 18 Oct 2026 07:52:31 +0000
Date: Sun, 18 Oct 2026 09:49:28 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [broonie-sound:for-7.4 37/72] sound/soc/soc-dapm.c:2893
 snd_soc_dapm_free_widget() warn: variable dereferenced before check 'w->dapm'
 (see line 2891)
Message-ID: <202610180339.A6POXeNa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Amadeusz S=C5=82awi=C5=84ski" <amade@asmblr.net>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git f=
or-7.4
head:   ba982c33278c1fc739c8c220f410d6539de9d9b9
commit: 568406bc832e7e9e333e2ab05aafd0b83ffb9610 [37/72] ASoC: soc-dapm: Re=
move widget from cache on removal
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: nios2-randconfig-r2202-20261017 (https://download.01.org/0day-ci/ar=
chive/20261018/202610180339.A6POXeNa-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610180339.A6POXeNa-lkp@intel.com/

smatch warnings:
sound/soc/soc-dapm.c:2893 snd_soc_dapm_free_widget() warn: variable derefer=
enced before check 'w->dapm' (see line 2891)

vim +2893 sound/soc/soc-dapm.c

8872293fc38c49 Lars-Peter Clausen   2013-06-14  2863 =20
da0398099a8348 Cezary Rojewski      2022-03-11  2864  /**
da0398099a8348 Cezary Rojewski      2022-03-11  2865   * snd_soc_dapm_free_=
widget - Free specified widget
da0398099a8348 Cezary Rojewski      2022-03-11  2866   * @w: widget to free
da0398099a8348 Cezary Rojewski      2022-03-11  2867   *
da0398099a8348 Cezary Rojewski      2022-03-11  2868   * Removes widget fro=
m all paths and frees memory occupied by it.
da0398099a8348 Cezary Rojewski      2022-03-11  2869   */
b97e26980f6c13 Lars-Peter Clausen   2015-07-21  2870  void snd_soc_dapm_fre=
e_widget(struct snd_soc_dapm_widget *w)
2b97eabc09f42d Richard Purdie       2006-10-06  2871  {
568406bc832e7e Amadeusz S=C5=82awi=C5=84ski   2026-10-14  2872  	struct snd=
_soc_dapm_context *d;
2b97eabc09f42d Richard Purdie       2006-10-06  2873  	struct snd_soc_dapm_=
path *p, *next_p;
a3423b02cf745c Lars-Peter Clausen   2015-08-11  2874  	enum snd_soc_dapm_di=
rection dir;
2b97eabc09f42d Richard Purdie       2006-10-06  2875 =20
1c9096f32ad23f Kuninori Morimoto    2022-10-17  2876  	if (!w)
1c9096f32ad23f Kuninori Morimoto    2022-10-17  2877  		return;
1c9096f32ad23f Kuninori Morimoto    2022-10-17  2878 =20
2b97eabc09f42d Richard Purdie       2006-10-06  2879  	list_del(&w->list);
5c6679b5cb120f Thomas Hebb          2020-12-12  2880  	list_del(&w->dirty);
8ddab3f5107c39 Jarkko Nikula        2010-12-14  2881  	/*
8ddab3f5107c39 Jarkko Nikula        2010-12-14  2882  	 * remove source and=
 sink paths associated to this widget.
8ddab3f5107c39 Jarkko Nikula        2010-12-14  2883  	 * While removing th=
e path, remove reference to it from both
8ddab3f5107c39 Jarkko Nikula        2010-12-14  2884  	 * source and sink w=
idgets so that path is removed only once.
8ddab3f5107c39 Jarkko Nikula        2010-12-14  2885  	 */
af6d53db28e644 Kuninori Morimoto    2026-01-20  2886  	dapm_for_each_direct=
ion(dir) {
a3423b02cf745c Lars-Peter Clausen   2015-08-11  2887  		snd_soc_dapm_widget=
_for_each_path_safe(w, dir, p, next_p)
8872293fc38c49 Lars-Peter Clausen   2013-06-14  2888  			dapm_free_path(p);
a3423b02cf745c Lars-Peter Clausen   2015-08-11  2889  	}
8872293fc38c49 Lars-Peter Clausen   2013-06-14  2890 =20
8ad13cdc92f663 Trevor Wu            2023-05-26 @2891  	dapm_debugfs_free_wi=
dget(w);
8ad13cdc92f663 Trevor Wu            2023-05-26  2892 =20
568406bc832e7e Amadeusz S=C5=82awi=C5=84ski   2026-10-14 @2893  	if (w->dap=
m) {
568406bc832e7e Amadeusz S=C5=82awi=C5=84ski   2026-10-14  2894  		if (w->da=
pm->card) {
568406bc832e7e Amadeusz S=C5=82awi=C5=84ski   2026-10-14  2895  			for_each=
_card_dapms(w->dapm->card, d) {
568406bc832e7e Amadeusz S=C5=82awi=C5=84ski   2026-10-14  2896  				if (d->=
wcache_sink =3D=3D w)
568406bc832e7e Amadeusz S=C5=82awi=C5=84ski   2026-10-14  2897  					d->wca=
che_sink =3D NULL;
568406bc832e7e Amadeusz S=C5=82awi=C5=84ski   2026-10-14  2898  				if (d->=
wcache_source =3D=3D w)
568406bc832e7e Amadeusz S=C5=82awi=C5=84ski   2026-10-14  2899  					d->wca=
che_source =3D NULL;
568406bc832e7e Amadeusz S=C5=82awi=C5=84ski   2026-10-14  2900  			}
568406bc832e7e Amadeusz S=C5=82awi=C5=84ski   2026-10-14  2901  		} else {
568406bc832e7e Amadeusz S=C5=82awi=C5=84ski   2026-10-14  2902  			if (w->d=
apm->wcache_sink =3D=3D w)
568406bc832e7e Amadeusz S=C5=82awi=C5=84ski   2026-10-14  2903  				w->dapm=
->wcache_sink =3D NULL;
568406bc832e7e Amadeusz S=C5=82awi=C5=84ski   2026-10-14  2904  			if (w->d=
apm->wcache_source =3D=3D w)
568406bc832e7e Amadeusz S=C5=82awi=C5=84ski   2026-10-14  2905  				w->dapm=
->wcache_source =3D NULL;
568406bc832e7e Amadeusz S=C5=82awi=C5=84ski   2026-10-14  2906  		}
568406bc832e7e Amadeusz S=C5=82awi=C5=84ski   2026-10-14  2907  	}
568406bc832e7e Amadeusz S=C5=82awi=C5=84ski   2026-10-14  2908 =20
fad598887dc0d8 Stephen Warren       2011-04-28  2909  	kfree(w->kcontrols);
48068961751038 Lars-Peter Clausen   2015-07-21  2910  	kfree_const(w->name);
199ed3e81c49a6 Pierre-Louis Bossart 2019-02-01  2911  	kfree_const(w->sname=
);
8ddab3f5107c39 Jarkko Nikula        2010-12-14  2912  	kfree(w);
8ddab3f5107c39 Jarkko Nikula        2010-12-14  2913  }
da0398099a8348 Cezary Rojewski      2022-03-11  2914  EXPORT_SYMBOL_GPL(snd=
_soc_dapm_free_widget);
b97e26980f6c13 Lars-Peter Clausen   2015-07-21  2915 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
