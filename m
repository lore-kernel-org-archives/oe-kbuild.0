Content-Type: multipart/mixed; boundary="===============7115506826813026890=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 3/4] scsi: core: Cap shost max_sectors according to DMA optimum mapping limits
Date: Sat, 21 May 2022 05:43:45 +0800
Message-ID: <202205210545.gkS834ds-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7115506826813026890==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <1653035003-70312-4-git-send-email-john.garry@huawei.com>
References: <1653035003-70312-4-git-send-email-john.garry@huawei.com>
TO: John Garry <john.garry@huawei.com>
TO: damien.lemoal(a)opensource.wdc.com
TO: joro(a)8bytes.org
TO: will(a)kernel.org
TO: jejb(a)linux.ibm.com
TO: martin.petersen(a)oracle.com
TO: hch(a)lst.de
TO: m.szyprowski(a)samsung.com
TO: robin.murphy(a)arm.com
CC: linux-doc(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: linux-ide(a)vger.kernel.org
CC: iommu(a)lists.linux-foundation.org
CC: linux-scsi(a)vger.kernel.org
CC: liyihang6(a)hisilicon.com
CC: chenxiang66(a)hisilicon.com
CC: thunder.leizhen(a)huawei.com
CC: John Garry <john.garry@huawei.com>

Hi John,

I love your patch! Perhaps something to improve:

[auto build test WARNING on joro-iommu/next]
[also build test WARNING on mkp-scsi/for-next jejb-scsi/for-next linus/mast=
er v5.18-rc7 next-20220520]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Garry/DMA-mappi=
ng-changes-for-SCSI-core/20220520-163049
base:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git next
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: s390-randconfig-m031-20220519 (https://download.01.org/0day-ci/arch=
ive/20220521/202205210545.gkS834ds-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/scsi/hosts.c:243 scsi_add_host_with_dma() warn: variable dereferenc=
ed before check 'dma_dev' (see line 228)

vim +/dma_dev +243 drivers/scsi/hosts.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  195  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  196  /**
d139b9bd0e52dd James Bottomley   2009-11-05  197   * scsi_add_host_with_dma=
 - add a scsi host with dma device
^1da177e4c3f41 Linus Torvalds    2005-04-16  198   * @shost:	scsi host poin=
ter to add
^1da177e4c3f41 Linus Torvalds    2005-04-16  199   * @dev:	a struct device =
of type scsi class
d139b9bd0e52dd James Bottomley   2009-11-05  200   * @dma_dev:	dma device f=
or the host
d139b9bd0e52dd James Bottomley   2009-11-05  201   *
d139b9bd0e52dd James Bottomley   2009-11-05  202   * Note: You rarely need =
to worry about this unless you're in a
d139b9bd0e52dd James Bottomley   2009-11-05  203   * virtualised host envir=
onments, so use the simpler scsi_add_host()
d139b9bd0e52dd James Bottomley   2009-11-05  204   * function instead.
^1da177e4c3f41 Linus Torvalds    2005-04-16  205   *
^1da177e4c3f41 Linus Torvalds    2005-04-16  206   * Return value: =

^1da177e4c3f41 Linus Torvalds    2005-04-16  207   * 	0 on success / !=3D 0=
 for error
^1da177e4c3f41 Linus Torvalds    2005-04-16  208   **/
d139b9bd0e52dd James Bottomley   2009-11-05  209  int scsi_add_host_with_dm=
a(struct Scsi_Host *shost, struct device *dev,
d139b9bd0e52dd James Bottomley   2009-11-05  210  			   struct device *dma_=
dev)
^1da177e4c3f41 Linus Torvalds    2005-04-16  211  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  212  	struct scsi_host_templat=
e *sht =3D shost->hostt;
^1da177e4c3f41 Linus Torvalds    2005-04-16  213  	int error =3D -EINVAL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  214  =

91921e016a2199 Hannes Reinecke   2014-06-25  215  	shost_printk(KERN_INFO, =
shost, "%s\n",
^1da177e4c3f41 Linus Torvalds    2005-04-16  216  			sht->info ? sht->info(=
shost) : sht->name);
^1da177e4c3f41 Linus Torvalds    2005-04-16  217  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  218  	if (!shost->can_queue) {
91921e016a2199 Hannes Reinecke   2014-06-25  219  		shost_printk(KERN_ERR, =
shost,
91921e016a2199 Hannes Reinecke   2014-06-25  220  			     "can_queue =3D 0 =
no longer supported\n");
542bd1377a9630 James Bottomley   2008-04-21  221  		goto fail;
^1da177e4c3f41 Linus Torvalds    2005-04-16  222  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  223  =

50b6cb3516365c Dexuan Cui        2021-10-07  224  	/* Use min_t(int, ...) i=
n case shost->can_queue exceeds SHRT_MAX */
50b6cb3516365c Dexuan Cui        2021-10-07  225  	shost->cmd_per_lun =3D m=
in_t(int, shost->cmd_per_lun,
ea2f0f77538c50 John Garry        2021-05-19  226  				   shost->can_queue);
ea2f0f77538c50 John Garry        2021-05-19  227  =

2ad7ba6ca08593 John Garry        2022-05-20 @228  	if (dma_dev->dma_mask) {
2ad7ba6ca08593 John Garry        2022-05-20  229  		shost->max_sectors =3D =
min_t(unsigned int, shost->max_sectors,
2ad7ba6ca08593 John Garry        2022-05-20  230  				dma_opt_mapping_size(=
dma_dev) >> SECTOR_SHIFT);
2ad7ba6ca08593 John Garry        2022-05-20  231  	}
2ad7ba6ca08593 John Garry        2022-05-20  232  =

0a6ac4ee7c2109 Christoph Hellwig 2017-01-03  233  	error =3D scsi_init_sens=
e_cache(shost);
0a6ac4ee7c2109 Christoph Hellwig 2017-01-03  234  	if (error)
0a6ac4ee7c2109 Christoph Hellwig 2017-01-03  235  		goto fail;
0a6ac4ee7c2109 Christoph Hellwig 2017-01-03  236  =

d285203cf647d7 Christoph Hellwig 2014-01-17  237  	error =3D scsi_mq_setup_=
tags(shost);
542bd1377a9630 James Bottomley   2008-04-21  238  	if (error)
542bd1377a9630 James Bottomley   2008-04-21  239  		goto fail;
d285203cf647d7 Christoph Hellwig 2014-01-17  240  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  241  	if (!shost->shost_gendev=
.parent)
^1da177e4c3f41 Linus Torvalds    2005-04-16  242  		shost->shost_gendev.par=
ent =3D dev ? dev : &platform_bus;
3c8d9a957d0ae6 James Bottomley   2012-05-04 @243  	if (!dma_dev)
3c8d9a957d0ae6 James Bottomley   2012-05-04  244  		dma_dev =3D shost->shos=
t_gendev.parent;
3c8d9a957d0ae6 James Bottomley   2012-05-04  245  =

d139b9bd0e52dd James Bottomley   2009-11-05  246  	shost->dma_dev =3D dma_d=
ev;
^1da177e4c3f41 Linus Torvalds    2005-04-16  247  =

5c6fab9d558470 Mika Westerberg   2016-02-18  248  	/*
5c6fab9d558470 Mika Westerberg   2016-02-18  249  	 * Increase usage count =
temporarily here so that calling
5c6fab9d558470 Mika Westerberg   2016-02-18  250  	 * scsi_autopm_put_host(=
) will trigger runtime idle if there is
5c6fab9d558470 Mika Westerberg   2016-02-18  251  	 * nothing else preventi=
ng suspending the device.
5c6fab9d558470 Mika Westerberg   2016-02-18  252  	 */
5c6fab9d558470 Mika Westerberg   2016-02-18  253  	pm_runtime_get_noresume(=
&shost->shost_gendev);
bc4f24014de58f Alan Stern        2010-06-17  254  	pm_runtime_set_active(&s=
host->shost_gendev);
bc4f24014de58f Alan Stern        2010-06-17  255  	pm_runtime_enable(&shost=
->shost_gendev);
bc4f24014de58f Alan Stern        2010-06-17  256  	device_enable_async_susp=
end(&shost->shost_gendev);
bc4f24014de58f Alan Stern        2010-06-17  257  =

0d5644b7d8daa3 Heiner Kallweit   2016-08-03  258  	error =3D device_add(&sh=
ost->shost_gendev);
0d5644b7d8daa3 Heiner Kallweit   2016-08-03  259  	if (error)
e9c787e65c0c36 Christoph Hellwig 2017-01-02  260  		goto out_disable_runtim=
e_pm;
0d5644b7d8daa3 Heiner Kallweit   2016-08-03  261  =

d3301874083874 Mike Anderson     2005-06-16  262  	scsi_host_set_state(shos=
t, SHOST_RUNNING);
^1da177e4c3f41 Linus Torvalds    2005-04-16  263  	get_device(shost->shost_=
gendev.parent);
^1da177e4c3f41 Linus Torvalds    2005-04-16  264  =

4cb077d93a57fb Rafael J. Wysocki 2010-02-08  265  	device_enable_async_susp=
end(&shost->shost_dev);
4cb077d93a57fb Rafael J. Wysocki 2010-02-08  266  =

11714026c02d61 Ming Lei          2021-06-02  267  	get_device(&shost->shost=
_gendev);
ee959b00c335d7 Tony Jones        2008-02-22  268  	error =3D device_add(&sh=
ost->shost_dev);
^1da177e4c3f41 Linus Torvalds    2005-04-16  269  	if (error)
^1da177e4c3f41 Linus Torvalds    2005-04-16  270  		goto out_del_gendev;
^1da177e4c3f41 Linus Torvalds    2005-04-16  271  =

77cca462c69d82 James Smart       2008-03-21  272  	if (shost->transportt->h=
ost_size) {
77cca462c69d82 James Smart       2008-03-21  273  		shost->shost_data =3D k=
zalloc(shost->transportt->host_size,
77cca462c69d82 James Smart       2008-03-21  274  					 GFP_KERNEL);
77cca462c69d82 James Smart       2008-03-21  275  		if (shost->shost_data =
=3D=3D NULL) {
77cca462c69d82 James Smart       2008-03-21  276  			error =3D -ENOMEM;
ee959b00c335d7 Tony Jones        2008-02-22  277  			goto out_del_dev;
77cca462c69d82 James Smart       2008-03-21  278  		}
77cca462c69d82 James Smart       2008-03-21  279  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  280  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  281  	if (shost->transportt->c=
reate_work_queue) {
aab0de245150c0 Kay Sievers       2008-05-02  282  		snprintf(shost->work_q_=
name, sizeof(shost->work_q_name),
aab0de245150c0 Kay Sievers       2008-05-02  283  			 "scsi_wq_%d", shost->=
host_no);
6292130093c5d1 Bob Liu           2020-07-01  284  		shost->work_q =3D alloc=
_workqueue("%s",
6292130093c5d1 Bob Liu           2020-07-01  285  			WQ_SYSFS | __WQ_LEGACY=
 | WQ_MEM_RECLAIM | WQ_UNBOUND,
6292130093c5d1 Bob Liu           2020-07-01  286  			1, shost->work_q_name);
6292130093c5d1 Bob Liu           2020-07-01  287  =

77cca462c69d82 James Smart       2008-03-21  288  		if (!shost->work_q) {
77cca462c69d82 James Smart       2008-03-21  289  			error =3D -EINVAL;
3719f4ff047e20 Ming Lei          2021-06-02  290  			goto out_del_dev;
^1da177e4c3f41 Linus Torvalds    2005-04-16  291  		}
77cca462c69d82 James Smart       2008-03-21  292  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  293  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  294  	error =3D scsi_sysfs_add=
_host(shost);
^1da177e4c3f41 Linus Torvalds    2005-04-16  295  	if (error)
3719f4ff047e20 Ming Lei          2021-06-02  296  		goto out_del_dev;
^1da177e4c3f41 Linus Torvalds    2005-04-16  297  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  298  	scsi_proc_host_add(shost=
);
5c6fab9d558470 Mika Westerberg   2016-02-18  299  	scsi_autopm_put_host(sho=
st);
^1da177e4c3f41 Linus Torvalds    2005-04-16  300  	return error;
^1da177e4c3f41 Linus Torvalds    2005-04-16  301  =

3719f4ff047e20 Ming Lei          2021-06-02  302  	/*
3719f4ff047e20 Ming Lei          2021-06-02  303  	 * Any host allocation i=
n this function will be freed in
3719f4ff047e20 Ming Lei          2021-06-02  304  	 * scsi_host_dev_release=
().
3719f4ff047e20 Ming Lei          2021-06-02  305  	 */
ee959b00c335d7 Tony Jones        2008-02-22  306   out_del_dev:
ee959b00c335d7 Tony Jones        2008-02-22  307  	device_del(&shost->shost=
_dev);
^1da177e4c3f41 Linus Torvalds    2005-04-16  308   out_del_gendev:
11714026c02d61 Ming Lei          2021-06-02  309  	/*
11714026c02d61 Ming Lei          2021-06-02  310  	 * Host state is SHOST_R=
UNNING so we have to explicitly release
11714026c02d61 Ming Lei          2021-06-02  311  	 * ->shost_dev.
11714026c02d61 Ming Lei          2021-06-02  312  	 */
11714026c02d61 Ming Lei          2021-06-02  313  	put_device(&shost->shost=
_dev);
^1da177e4c3f41 Linus Torvalds    2005-04-16  314  	device_del(&shost->shost=
_gendev);
e9c787e65c0c36 Christoph Hellwig 2017-01-02  315   out_disable_runtime_pm:
0d5644b7d8daa3 Heiner Kallweit   2016-08-03  316  	device_disable_async_sus=
pend(&shost->shost_gendev);
0d5644b7d8daa3 Heiner Kallweit   2016-08-03  317  	pm_runtime_disable(&shos=
t->shost_gendev);
0d5644b7d8daa3 Heiner Kallweit   2016-08-03  318  	pm_runtime_set_suspended=
(&shost->shost_gendev);
0d5644b7d8daa3 Heiner Kallweit   2016-08-03  319  	pm_runtime_put_noidle(&s=
host->shost_gendev);
542bd1377a9630 James Bottomley   2008-04-21  320   fail:
^1da177e4c3f41 Linus Torvalds    2005-04-16  321  	return error;
^1da177e4c3f41 Linus Torvalds    2005-04-16  322  }
d139b9bd0e52dd James Bottomley   2009-11-05  323  EXPORT_SYMBOL(scsi_add_ho=
st_with_dma);
^1da177e4c3f41 Linus Torvalds    2005-04-16  324  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7115506826813026890==--

