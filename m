Content-Type: multipart/mixed; boundary="===============4884935689795072285=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [dlemoal-libata:for-5.17-logging 18/79] drivers/ata/libata-eh.c:2713 ata_eh_reset() error: uninitialized symbol 'rc'.
Date: Fri, 31 Dec 2021 04:48:15 +0800
Message-ID: <202112310458.T2sWUhPF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4884935689795072285==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Hannes Reinecke <hare@suse.de>
CC: Damien Le Moal <damien.lemoal@opensource.wdc.com>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/dlemoal/libata.git fo=
r-5.17-logging
head:   7830f5151b3b153a04daec48653458c9a2db7b16
commit: aa1464975dcc4219113d0d3948590f17fc5da7c2 [18/79] libata: add reset =
tracepoints
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: s390-randconfig-m031-20211228 (https://download.01.org/0day-ci/arch=
ive/20211231/202112310458.T2sWUhPF-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/ata/libata-eh.c:2713 ata_eh_reset() error: uninitialized symbol 'rc=
'.

vim +/rc +2713 drivers/ata/libata-eh.c

664faf09a05d740 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
31  2448  =

fb7fd61454c8681 drivers/ata/libata-eh.c  Tejun Heo                 2007-09-=
23  2449  int ata_eh_reset(struct ata_link *link, int classify,
f5914a461eb9703 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
31  2450  		 ata_prereset_fn_t prereset, ata_reset_fn_t softreset,
022bdb075b9e1f2 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
15  2451  		 ata_reset_fn_t hardreset, ata_postreset_fn_t postreset)
022bdb075b9e1f2 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
15  2452  {
afaa5c373d2c49e drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
09  2453  	struct ata_port *ap =3D link->ap;
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2454  	struct ata_link *slave =3D ap->slave_link;
936fd7328657884 drivers/ata/libata-eh.c  Tejun Heo                 2007-08-=
06  2455  	struct ata_eh_context *ehc =3D &link->eh_context;
705d201414382b0 drivers/ata/libata-eh.c  Bartlomiej Zolnierkiewicz 2009-07-=
26  2456  	struct ata_eh_context *sehc =3D slave ? &slave->eh_context : NUL=
L;
664faf09a05d740 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
31  2457  	unsigned int *classes =3D ehc->classes;
416dc9ed206bba0 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
31  2458  	unsigned int lflags =3D link->flags;
1cdaf534f829b87 drivers/scsi/libata-eh.c Tejun Heo                 2006-07-=
03  2459  	int verbose =3D !(ehc->i.flags & ATA_EHI_QUIET);
d8af0eb6046c56e drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
20  2460  	int max_tries =3D 0, try =3D 0;
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2461  	struct ata_link *failed_link;
f58229f8060055b drivers/ata/libata-eh.c  Tejun Heo                 2007-08-=
06  2462  	struct ata_device *dev;
416dc9ed206bba0 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
31  2463  	unsigned long deadline, now;
022bdb075b9e1f2 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
15  2464  	ata_reset_fn_t reset;
afaa5c373d2c49e drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
09  2465  	unsigned long flags;
416dc9ed206bba0 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
31  2466  	u32 sstatus;
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2467  	int nr_unknown, rc;
022bdb075b9e1f2 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
15  2468  =

932648b007de76b drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2469  	/*
932648b007de76b drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2470  	 * Prepare to reset
932648b007de76b drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2471  	 */
d8af0eb6046c56e drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
20  2472  	while (ata_eh_reset_timeouts[max_tries] !=3D ULONG_MAX)
d8af0eb6046c56e drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
20  2473  		max_tries++;
ca6d43b051b5a06 drivers/ata/libata-eh.c  Dan Williams              2012-06-=
21  2474  	if (link->flags & ATA_LFLAG_RST_ONCE)
ca6d43b051b5a06 drivers/ata/libata-eh.c  Dan Williams              2012-06-=
21  2475  		max_tries =3D 1;
05944bdf6fadb53 drivers/ata/libata-eh.c  Tejun Heo                 2008-08-=
13  2476  	if (link->flags & ATA_LFLAG_NO_HRST)
05944bdf6fadb53 drivers/ata/libata-eh.c  Tejun Heo                 2008-08-=
13  2477  		hardreset =3D NULL;
05944bdf6fadb53 drivers/ata/libata-eh.c  Tejun Heo                 2008-08-=
13  2478  	if (link->flags & ATA_LFLAG_NO_SRST)
05944bdf6fadb53 drivers/ata/libata-eh.c  Tejun Heo                 2008-08-=
13  2479  		softreset =3D NULL;
d8af0eb6046c56e drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
20  2480  =

25985edcedea639 drivers/ata/libata-eh.c  Lucas De Marchi           2011-03-=
30  2481  	/* make sure each reset attempt is at least COOL_DOWN apart */
19b723218bde79c drivers/ata/libata-eh.c  Tejun Heo                 2008-11-=
04  2482  	if (ehc->i.flags & ATA_EHI_DID_RESET) {
0a2c0f56159999e drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
20  2483  		now =3D jiffies;
19b723218bde79c drivers/ata/libata-eh.c  Tejun Heo                 2008-11-=
04  2484  		WARN_ON(time_after(ehc->last_reset, now));
19b723218bde79c drivers/ata/libata-eh.c  Tejun Heo                 2008-11-=
04  2485  		deadline =3D ata_deadline(ehc->last_reset,
19b723218bde79c drivers/ata/libata-eh.c  Tejun Heo                 2008-11-=
04  2486  					ATA_EH_RESET_COOL_DOWN);
0a2c0f56159999e drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
20  2487  		if (time_before(now, deadline))
0a2c0f56159999e drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
20  2488  			schedule_timeout_uninterruptible(deadline - now);
19b723218bde79c drivers/ata/libata-eh.c  Tejun Heo                 2008-11-=
04  2489  	}
0a2c0f56159999e drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
20  2490  =

afaa5c373d2c49e drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
09  2491  	spin_lock_irqsave(ap->lock, flags);
afaa5c373d2c49e drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
09  2492  	ap->pflags |=3D ATA_PFLAG_RESETTING;
afaa5c373d2c49e drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
09  2493  	spin_unlock_irqrestore(ap->lock, flags);
afaa5c373d2c49e drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
09  2494  =

cf48062658e7ab3 drivers/ata/libata-eh.c  Tejun Heo                 2008-01-=
24  2495  	ata_eh_about_to_do(link, NULL, ATA_EH_RESET);
13abf50df209008 drivers/scsi/libata-eh.c Tejun Heo                 2006-07-=
10  2496  =

1eca4365be25c54 drivers/ata/libata-eh.c  Tejun Heo                 2008-11-=
03  2497  	ata_for_each_dev(dev, link, ALL) {
cdeab1140799f09 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
29  2498  		/* If we issue an SRST then an ATA drive (not ATAPI)
cdeab1140799f09 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
29  2499  		 * may change configuration and be in PIO0 timing. If
cdeab1140799f09 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
29  2500  		 * we do a hard reset (or are coming from power on)
cdeab1140799f09 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
29  2501  		 * this is true for ATA or ATAPI. Until we've set a
cdeab1140799f09 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
29  2502  		 * suitable controller mode we should not touch the
cdeab1140799f09 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
29  2503  		 * bus as we may be talking too fast.
cdeab1140799f09 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
29  2504  		 */
cdeab1140799f09 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
29  2505  		dev->pio_mode =3D XFER_PIO_0;
5416912af75de9c drivers/ata/libata-eh.c  Aaron Lu                  2012-12-=
03  2506  		dev->dma_mode =3D 0xff;
cdeab1140799f09 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
29  2507  =

cdeab1140799f09 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
29  2508  		/* If the controller has a pio mode setup function
cdeab1140799f09 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
29  2509  		 * then use it to set the chipset to rights. Don't
cdeab1140799f09 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
29  2510  		 * touch the DMA setup as that will be dealt with when
cdeab1140799f09 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
29  2511  		 * configuring devices.
cdeab1140799f09 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
29  2512  		 */
cdeab1140799f09 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
29  2513  		if (ap->ops->set_piomode)
cdeab1140799f09 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
29  2514  			ap->ops->set_piomode(ap, dev);
cdeab1140799f09 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
29  2515  	}
cdeab1140799f09 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
29  2516  =

cf48062658e7ab3 drivers/ata/libata-eh.c  Tejun Heo                 2008-01-=
24  2517  	/* prefer hardreset */
932648b007de76b drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2518  	reset =3D NULL;
cf48062658e7ab3 drivers/ata/libata-eh.c  Tejun Heo                 2008-01-=
24  2519  	ehc->i.action &=3D ~ATA_EH_RESET;
cf48062658e7ab3 drivers/ata/libata-eh.c  Tejun Heo                 2008-01-=
24  2520  	if (hardreset) {
cf48062658e7ab3 drivers/ata/libata-eh.c  Tejun Heo                 2008-01-=
24  2521  		reset =3D hardreset;
a674050e068a291 drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2522  		ehc->i.action |=3D ATA_EH_HARDRESET;
4f7faa3f2b99f8f drivers/ata/libata-eh.c  Tejun Heo                 2008-01-=
30  2523  	} else if (softreset) {
cf48062658e7ab3 drivers/ata/libata-eh.c  Tejun Heo                 2008-01-=
24  2524  		reset =3D softreset;
a674050e068a291 drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2525  		ehc->i.action |=3D ATA_EH_SOFTRESET;
cf48062658e7ab3 drivers/ata/libata-eh.c  Tejun Heo                 2008-01-=
24  2526  	}
f5914a461eb9703 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
31  2527  =

f5914a461eb9703 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
31  2528  	if (prereset) {
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2529  		unsigned long deadline =3D ata_deadline(jiffies,
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2530  						      ATA_EH_PRERESET_TIMEOUT);
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2531  =

b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2532  		if (slave) {
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2533  			sehc->i.action &=3D ~ATA_EH_RESET;
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2534  			sehc->i.action |=3D ehc->i.action;
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2535  		}
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2536  =

b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2537  		rc =3D prereset(link, deadline);
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2538  =

b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2539  		/* If present, do prereset on slave link too.  Reset
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2540  		 * is skipped iff both master and slave links report
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2541  		 * -ENOENT or clear ATA_EH_RESET.
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2542  		 */
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2543  		if (slave && (rc =3D=3D 0 || rc =3D=3D -ENOENT)) {
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2544  			int tmp;
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2545  =

b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2546  			tmp =3D prereset(slave, deadline);
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2547  			if (tmp !=3D -ENOENT)
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2548  				rc =3D tmp;
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2549  =

b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2550  			ehc->i.action |=3D sehc->i.action;
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2551  		}
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2552  =

f5914a461eb9703 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
31  2553  		if (rc) {
c961922b73dab42 drivers/ata/libata-eh.c  Alan Cox                  2006-09-=
26  2554  			if (rc =3D=3D -ENOENT) {
a9a79dfec239568 drivers/ata/libata-eh.c  Joe Perches               2011-04-=
15  2555  				ata_link_dbg(link, "port disabled--ignoring\n");
cf48062658e7ab3 drivers/ata/libata-eh.c  Tejun Heo                 2008-01-=
24  2556  				ehc->i.action &=3D ~ATA_EH_RESET;
4aa9ab67fb9c0df drivers/ata/libata-eh.c  Tejun Heo                 2007-03-=
12  2557  =

1eca4365be25c54 drivers/ata/libata-eh.c  Tejun Heo                 2008-11-=
03  2558  				ata_for_each_dev(dev, link, ALL)
f58229f8060055b drivers/ata/libata-eh.c  Tejun Heo                 2007-08-=
06  2559  					classes[dev->devno] =3D ATA_DEV_NONE;
4aa9ab67fb9c0df drivers/ata/libata-eh.c  Tejun Heo                 2007-03-=
12  2560  =

4aa9ab67fb9c0df drivers/ata/libata-eh.c  Tejun Heo                 2007-03-=
12  2561  				rc =3D 0;
c961922b73dab42 drivers/ata/libata-eh.c  Alan Cox                  2006-09-=
26  2562  			} else
a9a79dfec239568 drivers/ata/libata-eh.c  Joe Perches               2011-04-=
15  2563  				ata_link_err(link,
a9a79dfec239568 drivers/ata/libata-eh.c  Joe Perches               2011-04-=
15  2564  					     "prereset failed (errno=3D%d)\n",
a9a79dfec239568 drivers/ata/libata-eh.c  Joe Perches               2011-04-=
15  2565  					     rc);
fccb6ea5c240b9f drivers/ata/libata-eh.c  Tejun Heo                 2007-07-=
16  2566  			goto out;
f5914a461eb9703 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
31  2567  		}
f5914a461eb9703 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
31  2568  =

932648b007de76b drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2569  		/* prereset() might have cleared ATA_EH_RESET.  If so,
d6515e6ff4ad3db drivers/ata/libata-eh.c  Tejun Heo                 2009-03-=
04  2570  		 * bang classes, thaw and return.
932648b007de76b drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2571  		 */
932648b007de76b drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2572  		if (reset && !(ehc->i.action & ATA_EH_RESET)) {
1eca4365be25c54 drivers/ata/libata-eh.c  Tejun Heo                 2008-11-=
03  2573  			ata_for_each_dev(dev, link, ALL)
f58229f8060055b drivers/ata/libata-eh.c  Tejun Heo                 2007-08-=
06  2574  				classes[dev->devno] =3D ATA_DEV_NONE;
d6515e6ff4ad3db drivers/ata/libata-eh.c  Tejun Heo                 2009-03-=
04  2575  			if ((ap->pflags & ATA_PFLAG_FROZEN) &&
d6515e6ff4ad3db drivers/ata/libata-eh.c  Tejun Heo                 2009-03-=
04  2576  			    ata_is_host_link(link))
d6515e6ff4ad3db drivers/ata/libata-eh.c  Tejun Heo                 2009-03-=
04  2577  				ata_eh_thaw_port(ap);
fccb6ea5c240b9f drivers/ata/libata-eh.c  Tejun Heo                 2007-07-=
16  2578  			rc =3D 0;
fccb6ea5c240b9f drivers/ata/libata-eh.c  Tejun Heo                 2007-07-=
16  2579  			goto out;
f5914a461eb9703 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
31  2580  		}
932648b007de76b drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2581  	}
f5914a461eb9703 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
31  2582  =

022bdb075b9e1f2 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
15  2583   retry:
932648b007de76b drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2584  	/*
932648b007de76b drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2585  	 * Perform reset
932648b007de76b drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2586  	 */
dc98c32cbe80750 drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2587  	if (ata_is_host_link(link))
dc98c32cbe80750 drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2588  		ata_eh_freeze_port(ap);
dc98c32cbe80750 drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2589  =

341c2c958ec7bdd drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
20  2590  	deadline =3D ata_deadline(jiffies, ata_eh_reset_timeouts[try++]);
31daabda16063b6 drivers/ata/libata-eh.c  Tejun Heo                 2007-02-=
02  2591  =

932648b007de76b drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2592  	if (reset) {
3e706399b03bd23 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
31  2593  		if (verbose)
a9a79dfec239568 drivers/ata/libata-eh.c  Joe Perches               2011-04-=
15  2594  			ata_link_info(link, "%s resetting link\n",
022bdb075b9e1f2 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
15  2595  				      reset =3D=3D softreset ? "soft" : "hard");
022bdb075b9e1f2 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
15  2596  =

13abf50df209008 drivers/scsi/libata-eh.c Tejun Heo                 2006-07-=
10  2597  		/* mark that this EH session started with reset */
19b723218bde79c drivers/ata/libata-eh.c  Tejun Heo                 2008-11-=
04  2598  		ehc->last_reset =3D jiffies;
aa1464975dcc421 drivers/ata/libata-eh.c  Hannes Reinecke           2021-12-=
21  2599  		if (reset =3D=3D hardreset) {
0d64a233fe6a8fd drivers/ata/libata-eh.c  Tejun Heo                 2007-04-=
23  2600  			ehc->i.flags |=3D ATA_EHI_DID_HARDRESET;
aa1464975dcc421 drivers/ata/libata-eh.c  Hannes Reinecke           2021-12-=
21  2601  			trace_ata_link_hardreset_begin(link, classes, deadline);
aa1464975dcc421 drivers/ata/libata-eh.c  Hannes Reinecke           2021-12-=
21  2602  		} else {
0d64a233fe6a8fd drivers/ata/libata-eh.c  Tejun Heo                 2007-04-=
23  2603  			ehc->i.flags |=3D ATA_EHI_DID_SOFTRESET;
aa1464975dcc421 drivers/ata/libata-eh.c  Hannes Reinecke           2021-12-=
21  2604  			trace_ata_link_softreset_begin(link, classes, deadline);
aa1464975dcc421 drivers/ata/libata-eh.c  Hannes Reinecke           2021-12-=
21  2605  		}
022bdb075b9e1f2 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
15  2606  =

b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2607  		rc =3D ata_do_reset(link, reset, classes, deadline, true);
aa1464975dcc421 drivers/ata/libata-eh.c  Hannes Reinecke           2021-12-=
21  2608  		if (reset =3D=3D hardreset)
aa1464975dcc421 drivers/ata/libata-eh.c  Hannes Reinecke           2021-12-=
21  2609  			trace_ata_link_hardreset_end(link, classes, rc);
aa1464975dcc421 drivers/ata/libata-eh.c  Hannes Reinecke           2021-12-=
21  2610  		else
aa1464975dcc421 drivers/ata/libata-eh.c  Hannes Reinecke           2021-12-=
21  2611  			trace_ata_link_softreset_end(link, classes, rc);
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2612  		if (rc && rc !=3D -EAGAIN) {
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2613  			failed_link =3D link;
5dbfc9cb59d4ad7 drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2614  			goto fail;
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2615  		}
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2616  =

b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2617  		/* hardreset slave link if existent */
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2618  		if (slave && reset =3D=3D hardreset) {
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2619  			int tmp;
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2620  =

b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2621  			if (verbose)
a9a79dfec239568 drivers/ata/libata-eh.c  Joe Perches               2011-04-=
15  2622  				ata_link_info(slave, "hard resetting link\n");
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2623  =

b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2624  			ata_eh_about_to_do(slave, NULL, ATA_EH_RESET);
aa1464975dcc421 drivers/ata/libata-eh.c  Hannes Reinecke           2021-12-=
21  2625  			trace_ata_slave_hardreset_begin(slave, classes,
aa1464975dcc421 drivers/ata/libata-eh.c  Hannes Reinecke           2021-12-=
21  2626  							deadline);
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2627  			tmp =3D ata_do_reset(slave, reset, classes, deadline,
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2628  					   false);
aa1464975dcc421 drivers/ata/libata-eh.c  Hannes Reinecke           2021-12-=
21  2629  			trace_ata_slave_hardreset_end(slave, classes, tmp);
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2630  			switch (tmp) {
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2631  			case -EAGAIN:
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2632  				rc =3D -EAGAIN;
e06abcc68cb5553 drivers/ata/libata-eh.c  Gustavo A. R. Silva       2021-04-=
20  2633  				break;
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2634  			case 0:
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2635  				break;
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2636  			default:
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2637  				failed_link =3D slave;
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2638  				rc =3D tmp;
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2639  				goto fail;
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2640  			}
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2641  		}
022bdb075b9e1f2 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
15  2642  =

b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2643  		/* perform follow-up SRST if necessary */
664faf09a05d740 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
31  2644  		if (reset =3D=3D hardreset &&
e8411fbad67a6fe drivers/ata/libata-eh.c  Sergei Shtylyov           2011-08-=
09  2645  		    ata_eh_followup_srst_needed(link, rc)) {
664faf09a05d740 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
31  2646  			reset =3D softreset;
664faf09a05d740 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
31  2647  =

664faf09a05d740 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
31  2648  			if (!reset) {
a9a79dfec239568 drivers/ata/libata-eh.c  Joe Perches               2011-04-=
15  2649  				ata_link_err(link,
a9a79dfec239568 drivers/ata/libata-eh.c  Joe Perches               2011-04-=
15  2650  	     "follow-up softreset required but no softreset available\n"=
);
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2651  				failed_link =3D link;
fccb6ea5c240b9f drivers/ata/libata-eh.c  Tejun Heo                 2007-07-=
16  2652  				rc =3D -EINVAL;
08cf69d005acda7 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
31  2653  				goto fail;
664faf09a05d740 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
31  2654  			}
664faf09a05d740 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
31  2655  =

cf48062658e7ab3 drivers/ata/libata-eh.c  Tejun Heo                 2008-01-=
24  2656  			ata_eh_about_to_do(link, NULL, ATA_EH_RESET);
aa1464975dcc421 drivers/ata/libata-eh.c  Hannes Reinecke           2021-12-=
21  2657  			trace_ata_link_softreset_begin(link, classes, deadline);
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2658  			rc =3D ata_do_reset(link, reset, classes, deadline, true);
aa1464975dcc421 drivers/ata/libata-eh.c  Hannes Reinecke           2021-12-=
21  2659  			trace_ata_link_softreset_end(link, classes, rc);
fe2c4d018fc6127 drivers/ata/libata-eh.c  Tejun Heo                 2009-07-=
08  2660  			if (rc) {
fe2c4d018fc6127 drivers/ata/libata-eh.c  Tejun Heo                 2009-07-=
08  2661  				failed_link =3D link;
fe2c4d018fc6127 drivers/ata/libata-eh.c  Tejun Heo                 2009-07-=
08  2662  				goto fail;
fe2c4d018fc6127 drivers/ata/libata-eh.c  Tejun Heo                 2009-07-=
08  2663  			}
08cf69d005acda7 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
31  2664  		}
932648b007de76b drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2665  	} else {
932648b007de76b drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2666  		if (verbose)
a9a79dfec239568 drivers/ata/libata-eh.c  Joe Perches               2011-04-=
15  2667  			ata_link_info(link,
a9a79dfec239568 drivers/ata/libata-eh.c  Joe Perches               2011-04-=
15  2668  	"no reset method available, skipping reset\n");
932648b007de76b drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2669  		if (!(lflags & ATA_LFLAG_ASSUME_CLASS))
932648b007de76b drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2670  			lflags |=3D ATA_LFLAG_ASSUME_ATA;
932648b007de76b drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2671  	}
664faf09a05d740 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
31  2672  =

932648b007de76b drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2673  	/*
932648b007de76b drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2674  	 * Post-reset processing
932648b007de76b drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2675  	 */
1eca4365be25c54 drivers/ata/libata-eh.c  Tejun Heo                 2008-11-=
03  2676  	ata_for_each_dev(dev, link, ALL) {
416dc9ed206bba0 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
31  2677  		/* After the reset, the device state is PIO 0 and the
416dc9ed206bba0 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
31  2678  		 * controller state is undefined.  Reset also wakes up
416dc9ed206bba0 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
31  2679  		 * drives from sleeping mode.
20952b699035448 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
31  2680  		 */
f58229f8060055b drivers/ata/libata-eh.c  Tejun Heo                 2007-08-=
06  2681  		dev->pio_mode =3D XFER_PIO_0;
054a5fbaceb2eb3 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
25  2682  		dev->flags &=3D ~ATA_DFLAG_SLEEPING;
20952b699035448 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
31  2683  =

3b761d3d437cffc drivers/ata/libata-eh.c  Tejun Heo                 2009-10-=
06  2684  		if (ata_phys_link_offline(ata_dev_phys_link(dev)))
3b761d3d437cffc drivers/ata/libata-eh.c  Tejun Heo                 2009-10-=
06  2685  			continue;
3b761d3d437cffc drivers/ata/libata-eh.c  Tejun Heo                 2009-10-=
06  2686  =

4ccd3329a2e5147 drivers/ata/libata-eh.c  Tejun Heo                 2008-01-=
08  2687  		/* apply class override */
416dc9ed206bba0 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
31  2688  		if (lflags & ATA_LFLAG_ASSUME_ATA)
ae791c05694d739 drivers/ata/libata-eh.c  Tejun Heo                 2007-09-=
23  2689  			classes[dev->devno] =3D ATA_DEV_ATA;
416dc9ed206bba0 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
31  2690  		else if (lflags & ATA_LFLAG_ASSUME_SEMB)
816ab89782ac139 drivers/ata/libata-eh.c  Tejun Heo                 2008-10-=
22  2691  			classes[dev->devno] =3D ATA_DEV_SEMB_UNSUP;
ae791c05694d739 drivers/ata/libata-eh.c  Tejun Heo                 2007-09-=
23  2692  	}
ae791c05694d739 drivers/ata/libata-eh.c  Tejun Heo                 2007-09-=
23  2693  =

008a78961ec7299 drivers/ata/libata-eh.c  Tejun Heo                 2007-07-=
16  2694  	/* record current link speed */
936fd7328657884 drivers/ata/libata-eh.c  Tejun Heo                 2007-08-=
06  2695  	if (sata_scr_read(link, SCR_STATUS, &sstatus) =3D=3D 0)
936fd7328657884 drivers/ata/libata-eh.c  Tejun Heo                 2007-08-=
06  2696  		link->sata_spd =3D (sstatus >> 4) & 0xf;
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2697  	if (slave && sata_scr_read(slave, SCR_STATUS, &sstatus) =3D=3D 0)
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2698  		slave->sata_spd =3D (sstatus >> 4) & 0xf;
008a78961ec7299 drivers/ata/libata-eh.c  Tejun Heo                 2007-07-=
16  2699  =

dc98c32cbe80750 drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2700  	/* thaw the port */
dc98c32cbe80750 drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2701  	if (ata_is_host_link(link))
dc98c32cbe80750 drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2702  		ata_eh_thaw_port(ap);
dc98c32cbe80750 drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2703  =

f046519fc85a8fd drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2704  	/* postreset() should clear hardware SError.  Although SError
f046519fc85a8fd drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2705  	 * is cleared during link resume, clearing SError here is
f046519fc85a8fd drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2706  	 * necessary as some PHYs raise hotplug events after SRST.
f046519fc85a8fd drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2707  	 * This introduces race condition where hotplug occurs between
f046519fc85a8fd drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2708  	 * reset and here.  This race is mediated by cross checking
f046519fc85a8fd drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2709  	 * link onlineness and classification result later.
f046519fc85a8fd drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2710  	 */
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2711  	if (postreset) {
cc0680a580b5be8 drivers/ata/libata-eh.c  Tejun Heo                 2007-08-=
06  2712  		postreset(link, classes);
aa1464975dcc421 drivers/ata/libata-eh.c  Hannes Reinecke           2021-12-=
21 @2713  		trace_ata_link_postreset(link, classes, rc);
aa1464975dcc421 drivers/ata/libata-eh.c  Hannes Reinecke           2021-12-=
21  2714  		if (slave) {
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2715  			postreset(slave, classes);
aa1464975dcc421 drivers/ata/libata-eh.c  Hannes Reinecke           2021-12-=
21  2716  			trace_ata_slave_postreset(slave, classes, rc);
aa1464975dcc421 drivers/ata/libata-eh.c  Hannes Reinecke           2021-12-=
21  2717  		}
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2718  	}
022bdb075b9e1f2 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
15  2719  =

1e641060c4b564e drivers/ata/libata-eh.c  Tejun Heo                 2009-07-=
17  2720  	/*
8c56cacc724c765 drivers/ata/libata-eh.c  Tejun Heo                 2011-05-=
25  2721  	 * Some controllers can't be frozen very well and may set spurio=
us
8c56cacc724c765 drivers/ata/libata-eh.c  Tejun Heo                 2011-05-=
25  2722  	 * error conditions during reset.  Clear accumulated error
8c56cacc724c765 drivers/ata/libata-eh.c  Tejun Heo                 2011-05-=
25  2723  	 * information and re-thaw the port if frozen.  As reset is the
8c56cacc724c765 drivers/ata/libata-eh.c  Tejun Heo                 2011-05-=
25  2724  	 * final recovery action and we cross check link onlineness agai=
nst
8c56cacc724c765 drivers/ata/libata-eh.c  Tejun Heo                 2011-05-=
25  2725  	 * device classification later, no hotplug event is lost by this.
1e641060c4b564e drivers/ata/libata-eh.c  Tejun Heo                 2009-07-=
17  2726  	 */
f046519fc85a8fd drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2727  	spin_lock_irqsave(link->ap->lock, flags);
1e641060c4b564e drivers/ata/libata-eh.c  Tejun Heo                 2009-07-=
17  2728  	memset(&link->eh_info, 0, sizeof(link->eh_info));
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2729  	if (slave)
1e641060c4b564e drivers/ata/libata-eh.c  Tejun Heo                 2009-07-=
17  2730  		memset(&slave->eh_info, 0, sizeof(link->eh_info));
1e641060c4b564e drivers/ata/libata-eh.c  Tejun Heo                 2009-07-=
17  2731  	ap->pflags &=3D ~ATA_PFLAG_EH_PENDING;
f046519fc85a8fd drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2732  	spin_unlock_irqrestore(link->ap->lock, flags);
f046519fc85a8fd drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2733  =

8c56cacc724c765 drivers/ata/libata-eh.c  Tejun Heo                 2011-05-=
25  2734  	if (ap->pflags & ATA_PFLAG_FROZEN)
8c56cacc724c765 drivers/ata/libata-eh.c  Tejun Heo                 2011-05-=
25  2735  		ata_eh_thaw_port(ap);
8c56cacc724c765 drivers/ata/libata-eh.c  Tejun Heo                 2011-05-=
25  2736  =

3b761d3d437cffc drivers/ata/libata-eh.c  Tejun Heo                 2009-10-=
06  2737  	/*
3b761d3d437cffc drivers/ata/libata-eh.c  Tejun Heo                 2009-10-=
06  2738  	 * Make sure onlineness and classification result correspond.
f046519fc85a8fd drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2739  	 * Hotplug could have happened during reset and some
f046519fc85a8fd drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2740  	 * controllers fail to wait while a drive is spinning up after
f046519fc85a8fd drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2741  	 * being hotplugged causing misdetection.  By cross checking
3b761d3d437cffc drivers/ata/libata-eh.c  Tejun Heo                 2009-10-=
06  2742  	 * link on/offlineness and classification result, those
3b761d3d437cffc drivers/ata/libata-eh.c  Tejun Heo                 2009-10-=
06  2743  	 * conditions can be reliably detected and retried.
f046519fc85a8fd drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2744  	 */
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2745  	nr_unknown =3D 0;
1eca4365be25c54 drivers/ata/libata-eh.c  Tejun Heo                 2008-11-=
03  2746  	ata_for_each_dev(dev, link, ALL) {
3b761d3d437cffc drivers/ata/libata-eh.c  Tejun Heo                 2009-10-=
06  2747  		if (ata_phys_link_online(ata_dev_phys_link(dev))) {
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2748  			if (classes[dev->devno] =3D=3D ATA_DEV_UNKNOWN) {
a9a79dfec239568 drivers/ata/libata-eh.c  Joe Perches               2011-04-=
15  2749  				ata_dev_dbg(dev, "link online but device misclassified\n");
f046519fc85a8fd drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2750  				classes[dev->devno] =3D ATA_DEV_NONE;
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2751  				nr_unknown++;
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2752  			}
3b761d3d437cffc drivers/ata/libata-eh.c  Tejun Heo                 2009-10-=
06  2753  		} else if (ata_phys_link_offline(ata_dev_phys_link(dev))) {
3b761d3d437cffc drivers/ata/libata-eh.c  Tejun Heo                 2009-10-=
06  2754  			if (ata_class_enabled(classes[dev->devno]))
a9a79dfec239568 drivers/ata/libata-eh.c  Joe Perches               2011-04-=
15  2755  				ata_dev_dbg(dev,
a9a79dfec239568 drivers/ata/libata-eh.c  Joe Perches               2011-04-=
15  2756  					    "link offline, clearing class %d to NONE\n",
3b761d3d437cffc drivers/ata/libata-eh.c  Tejun Heo                 2009-10-=
06  2757  					    classes[dev->devno]);
3b761d3d437cffc drivers/ata/libata-eh.c  Tejun Heo                 2009-10-=
06  2758  			classes[dev->devno] =3D ATA_DEV_NONE;
3b761d3d437cffc drivers/ata/libata-eh.c  Tejun Heo                 2009-10-=
06  2759  		} else if (classes[dev->devno] =3D=3D ATA_DEV_UNKNOWN) {
a9a79dfec239568 drivers/ata/libata-eh.c  Joe Perches               2011-04-=
15  2760  			ata_dev_dbg(dev,
a9a79dfec239568 drivers/ata/libata-eh.c  Joe Perches               2011-04-=
15  2761  				    "link status unknown, clearing UNKNOWN to NONE\n");
3b761d3d437cffc drivers/ata/libata-eh.c  Tejun Heo                 2009-10-=
06  2762  			classes[dev->devno] =3D ATA_DEV_NONE;
3b761d3d437cffc drivers/ata/libata-eh.c  Tejun Heo                 2009-10-=
06  2763  		}
f046519fc85a8fd drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2764  	}
f046519fc85a8fd drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2765  =

b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2766  	if (classify && nr_unknown) {
f046519fc85a8fd drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2767  		if (try < max_tries) {
a9a79dfec239568 drivers/ata/libata-eh.c  Joe Perches               2011-04-=
15  2768  			ata_link_warn(link,
a9a79dfec239568 drivers/ata/libata-eh.c  Joe Perches               2011-04-=
15  2769  				      "link online but %d devices misclassified, retrying\n",
3b761d3d437cffc drivers/ata/libata-eh.c  Tejun Heo                 2009-10-=
06  2770  				      nr_unknown);
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2771  			failed_link =3D link;
f046519fc85a8fd drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2772  			rc =3D -EAGAIN;
f046519fc85a8fd drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2773  			goto fail;
f046519fc85a8fd drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2774  		}
a9a79dfec239568 drivers/ata/libata-eh.c  Joe Perches               2011-04-=
15  2775  		ata_link_warn(link,
3b761d3d437cffc drivers/ata/libata-eh.c  Tejun Heo                 2009-10-=
06  2776  			      "link online but %d devices misclassified, "
3b761d3d437cffc drivers/ata/libata-eh.c  Tejun Heo                 2009-10-=
06  2777  			      "device detection might fail\n", nr_unknown);
f046519fc85a8fd drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2778  	}
f046519fc85a8fd drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
19  2779  =

022bdb075b9e1f2 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
15  2780  	/* reset successful, schedule revalidation */
cf48062658e7ab3 drivers/ata/libata-eh.c  Tejun Heo                 2008-01-=
24  2781  	ata_eh_done(link, NULL, ATA_EH_RESET);
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2782  	if (slave)
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2783  		ata_eh_done(slave, NULL, ATA_EH_RESET);
19b723218bde79c drivers/ata/libata-eh.c  Tejun Heo                 2008-11-=
04  2784  	ehc->last_reset =3D jiffies;		/* update to completion time */
022bdb075b9e1f2 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
15  2785  	ehc->i.action |=3D ATA_EH_REVALIDATE;
6b7ae9545ad9875 drivers/ata/libata-eh.c  Tejun Heo                 2010-09-=
01  2786  	link->lpm_policy =3D ATA_LPM_UNKNOWN;	/* reset LPM state */
416dc9ed206bba0 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
31  2787  =

416dc9ed206bba0 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
31  2788  	rc =3D 0;
fccb6ea5c240b9f drivers/ata/libata-eh.c  Tejun Heo                 2007-07-=
16  2789   out:
fccb6ea5c240b9f drivers/ata/libata-eh.c  Tejun Heo                 2007-07-=
16  2790  	/* clear hotplug flag */
fccb6ea5c240b9f drivers/ata/libata-eh.c  Tejun Heo                 2007-07-=
16  2791  	ehc->i.flags &=3D ~ATA_EHI_HOTPLUGGED;
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2792  	if (slave)
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2793  		sehc->i.flags &=3D ~ATA_EHI_HOTPLUGGED;
afaa5c373d2c49e drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
09  2794  =

afaa5c373d2c49e drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
09  2795  	spin_lock_irqsave(ap->lock, flags);
afaa5c373d2c49e drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
09  2796  	ap->pflags &=3D ~ATA_PFLAG_RESETTING;
afaa5c373d2c49e drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
09  2797  	spin_unlock_irqrestore(ap->lock, flags);
afaa5c373d2c49e drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
09  2798  =

022bdb075b9e1f2 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
15  2799  	return rc;
416dc9ed206bba0 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
31  2800  =

416dc9ed206bba0 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
31  2801   fail:
5958e3025fd9d97 drivers/ata/libata-eh.c  Tejun Heo                 2008-04-=
07  2802  	/* if SCR isn't accessible on a fan-out port, PMP needs to be re=
set */
5958e3025fd9d97 drivers/ata/libata-eh.c  Tejun Heo                 2008-04-=
07  2803  	if (!ata_is_host_link(link) &&
5958e3025fd9d97 drivers/ata/libata-eh.c  Tejun Heo                 2008-04-=
07  2804  	    sata_scr_read(link, SCR_STATUS, &sstatus))
5958e3025fd9d97 drivers/ata/libata-eh.c  Tejun Heo                 2008-04-=
07  2805  		rc =3D -ERESTART;
5958e3025fd9d97 drivers/ata/libata-eh.c  Tejun Heo                 2008-04-=
07  2806  =

7a46c0780babea7 drivers/ata/libata-eh.c  Gwendal Grignou           2011-10-=
19  2807  	if (try >=3D max_tries) {
8ea7645c5a949f9 drivers/ata/libata-eh.c  Tejun Heo                 2011-05-=
25  2808  		/*
8ea7645c5a949f9 drivers/ata/libata-eh.c  Tejun Heo                 2011-05-=
25  2809  		 * Thaw host port even if reset failed, so that the port
8ea7645c5a949f9 drivers/ata/libata-eh.c  Tejun Heo                 2011-05-=
25  2810  		 * can be retried on the next phy event.  This risks
8ea7645c5a949f9 drivers/ata/libata-eh.c  Tejun Heo                 2011-05-=
25  2811  		 * repeated EH runs but seems to be a better tradeoff than
8ea7645c5a949f9 drivers/ata/libata-eh.c  Tejun Heo                 2011-05-=
25  2812  		 * shutting down a port after a botched hotplug attempt.
8ea7645c5a949f9 drivers/ata/libata-eh.c  Tejun Heo                 2011-05-=
25  2813  		 */
8ea7645c5a949f9 drivers/ata/libata-eh.c  Tejun Heo                 2011-05-=
25  2814  		if (ata_is_host_link(link))
8ea7645c5a949f9 drivers/ata/libata-eh.c  Tejun Heo                 2011-05-=
25  2815  			ata_eh_thaw_port(ap);
416dc9ed206bba0 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
31  2816  		goto out;
8ea7645c5a949f9 drivers/ata/libata-eh.c  Tejun Heo                 2011-05-=
25  2817  	}
416dc9ed206bba0 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
31  2818  =

416dc9ed206bba0 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
31  2819  	now =3D jiffies;
416dc9ed206bba0 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
31  2820  	if (time_before(now, deadline)) {
416dc9ed206bba0 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
31  2821  		unsigned long delta =3D deadline - now;
416dc9ed206bba0 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
31  2822  =

a9a79dfec239568 drivers/ata/libata-eh.c  Joe Perches               2011-04-=
15  2823  		ata_link_warn(failed_link,
0a2c0f56159999e drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
20  2824  			"reset failed (errno=3D%d), retrying in %u secs\n",
0a2c0f56159999e drivers/ata/libata-eh.c  Tejun Heo                 2008-05-=
20  2825  			rc, DIV_ROUND_UP(jiffies_to_msecs(delta), 1000));
416dc9ed206bba0 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
31  2826  =

c0c362b60e259e3 drivers/ata/libata-eh.c  Tejun Heo                 2010-09-=
06  2827  		ata_eh_release(ap);
416dc9ed206bba0 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
31  2828  		while (delta)
416dc9ed206bba0 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
31  2829  			delta =3D schedule_timeout_uninterruptible(delta);
c0c362b60e259e3 drivers/ata/libata-eh.c  Tejun Heo                 2010-09-=
06  2830  		ata_eh_acquire(ap);
416dc9ed206bba0 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
31  2831  	}
416dc9ed206bba0 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
31  2832  =

7a46c0780babea7 drivers/ata/libata-eh.c  Gwendal Grignou           2011-10-=
19  2833  	/*
7a46c0780babea7 drivers/ata/libata-eh.c  Gwendal Grignou           2011-10-=
19  2834  	 * While disks spinup behind PMP, some controllers fail sending =
SRST.
7a46c0780babea7 drivers/ata/libata-eh.c  Gwendal Grignou           2011-10-=
19  2835  	 * They need to be reset - as well as the PMP - before retrying.
7a46c0780babea7 drivers/ata/libata-eh.c  Gwendal Grignou           2011-10-=
19  2836  	 */
7a46c0780babea7 drivers/ata/libata-eh.c  Gwendal Grignou           2011-10-=
19  2837  	if (rc =3D=3D -ERESTART) {
7a46c0780babea7 drivers/ata/libata-eh.c  Gwendal Grignou           2011-10-=
19  2838  		if (ata_is_host_link(link))
7a46c0780babea7 drivers/ata/libata-eh.c  Gwendal Grignou           2011-10-=
19  2839  			ata_eh_thaw_port(ap);
7a46c0780babea7 drivers/ata/libata-eh.c  Gwendal Grignou           2011-10-=
19  2840  		goto out;
7a46c0780babea7 drivers/ata/libata-eh.c  Gwendal Grignou           2011-10-=
19  2841  	}
7a46c0780babea7 drivers/ata/libata-eh.c  Gwendal Grignou           2011-10-=
19  2842  =

b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2843  	if (try =3D=3D max_tries - 1) {
a07d499b4759881 drivers/ata/libata-eh.c  Tejun Heo                 2009-01-=
29  2844  		sata_down_spd_limit(link, 0);
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2845  		if (slave)
a07d499b4759881 drivers/ata/libata-eh.c  Tejun Heo                 2009-01-=
29  2846  			sata_down_spd_limit(slave, 0);
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2847  	} else if (rc =3D=3D -EPIPE)
a07d499b4759881 drivers/ata/libata-eh.c  Tejun Heo                 2009-01-=
29  2848  		sata_down_spd_limit(failed_link, 0);
b1c72916abbdd0a drivers/ata/libata-eh.c  Tejun Heo                 2008-07-=
31  2849  =

416dc9ed206bba0 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
31  2850  	if (hardreset)
416dc9ed206bba0 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
31  2851  		reset =3D hardreset;
416dc9ed206bba0 drivers/ata/libata-eh.c  Tejun Heo                 2007-10-=
31  2852  	goto retry;
022bdb075b9e1f2 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
15  2853  }
022bdb075b9e1f2 drivers/scsi/libata-eh.c Tejun Heo                 2006-05-=
15  2854  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4884935689795072285==--

