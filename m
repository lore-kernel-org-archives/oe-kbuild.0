Content-Type: multipart/mixed; boundary="===============1037150609509380418=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [hare-scsi-devel:reserved-tags.v4 4/22] drivers/scsi/fnic/fnic_scsi.c:2500 fnic_device_reset() error: we previously assumed 'reset_sc' could be null (see line 2336)
Date: Tue, 07 Jul 2020 17:30:49 +0300
Message-ID: <20200707143048.GE2549@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1037150609509380418==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git=
 reserved-tags.v4
head:   2a2c3155f8291828f41350cf90a0c8a37cdd263c
commit: 3b695cc5f04ad6099906a94408410af8078704bf [4/22] fnic: use internal =
commands
config: i386-randconfig-m021-20200705 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-14) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/scsi/fnic/fnic_scsi.c:2500 fnic_device_reset() error: we previously=
 assumed 'reset_sc' could be null (see line 2336)

# https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git/commi=
t/?id=3D3b695cc5f04ad6099906a94408410af8078704bf
git remote add hare-scsi-devel https://git.kernel.org/pub/scm/linux/kernel/=
git/hare/scsi-devel.git
git remote update hare-scsi-devel
git checkout 3b695cc5f04ad6099906a94408410af8078704bf
vim +/reset_sc +2500 drivers/scsi/fnic/fnic_scsi.c

5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2290  int fnic_device_reset(st=
ruct scsi_cmnd *sc)
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2291  {
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2292  	struct fc_lport *lp;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2293  	struct fnic *fnic;
4d7007b49d523d Hiral Patel       2013-02-12  2294  	struct fnic_io_req *io_=
req =3D NULL;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2295  	struct fc_rport *rport;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2296  	int status;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2297  	int ret =3D FAILED;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2298  	spinlock_t *io_lock;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2299  	unsigned long flags;
14eb5d905d16ec Hiral Patel       2013-02-12  2300  	unsigned long start_tim=
e =3D 0;
3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2301  	struct scsi_device *sde=
v =3D sc->device;
03298552cba38f Hiral Patel       2013-02-12  2302  	struct scsi_lun fc_lun;
67125b0287a9e6 Hiral Patel       2013-09-12  2303  	struct fnic_stats *fnic=
_stats;
67125b0287a9e6 Hiral Patel       2013-09-12  2304  	struct reset_stats *res=
et_stats;
4d7007b49d523d Hiral Patel       2013-02-12  2305  	int tag =3D 0;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2306  	DECLARE_COMPLETION_ONST=
ACK(tm_done);
3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2307  	struct scsi_cmnd *reset=
_sc =3D NULL;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2308  =

5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2309  	/* Wait for rport to un=
block */
65d430fa99cbd0 Christof Schmitt  2009-10-30  2310  	fc_block_scsi_eh(sc);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2311  =

5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2312  	/* Get local-port, chec=
k ready and link up */
3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2313  	lp =3D shost_priv(sdev-=
>host);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2314  =

5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2315  	fnic =3D lport_priv(lp);
67125b0287a9e6 Hiral Patel       2013-09-12  2316  	fnic_stats =3D &fnic->f=
nic_stats;
67125b0287a9e6 Hiral Patel       2013-09-12  2317  	reset_stats =3D &fnic->=
fnic_stats.reset_stats;
67125b0287a9e6 Hiral Patel       2013-09-12  2318  =

67125b0287a9e6 Hiral Patel       2013-09-12  2319  	atomic64_inc(&reset_sta=
ts->device_resets);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2320  =

3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2321  	rport =3D starget_to_rp=
ort(scsi_target(sdev));
0db6f4353d68c0 Roel Kluin        2010-06-11  2322  	FNIC_SCSI_DBG(KERN_DEBU=
G, fnic->lport->host,
9cb78c16f5dade Hannes Reinecke   2014-06-25  2323  		      "Device reset ca=
lled FCID 0x%x, LUN 0x%llx sc 0x%p\n",
3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2324  		      rport->port_id, =
sdev->lun, sc);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2325  =

5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2326  	if (lp->state !=3D LPOR=
T_ST_READY || !(lp->link_up))
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2327  		goto fnic_device_reset=
_end;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2328  =

5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2329  	/* Check if remote port=
 up */
67125b0287a9e6 Hiral Patel       2013-09-12  2330  	if (fc_remote_port_chkr=
eady(rport)) {
67125b0287a9e6 Hiral Patel       2013-09-12  2331  		atomic64_inc(&fnic_sta=
ts->misc_stats.rport_not_ready);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2332  		goto fnic_device_reset=
_end;
67125b0287a9e6 Hiral Patel       2013-09-12  2333  	}
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2334  =

3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2335  	reset_sc =3D scsi_get_i=
nternal_cmd(sdev, DMA_NONE, REQ_NOWAIT);
3b695cc5f04ad6 Hannes Reinecke   2020-03-11 @2336  	if (unlikely(!reset_sc))
03298552cba38f Hiral Patel       2013-02-12  2337  		goto fnic_device_reset=
_end;
                                                                ^^^^^^^^^^^=
^^^^^^^^^^^^^^^^
NULL on this path.

3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2338  =

3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2339  	CMD_FLAGS(reset_sc) =3D=
 FNIC_DEVICE_RESET;
3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2340  	tag =3D reset_sc->reque=
st->tag;
3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2341  	io_lock =3D fnic_io_loc=
k_hash(fnic, reset_sc);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2342  	spin_lock_irqsave(io_lo=
ck, flags);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2343  =

5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2344  	/*
3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2345  	 * Allocate a new io_re=
q.
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2346  	 */
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2347  	io_req =3D mempool_allo=
c(fnic->io_req_pool, GFP_ATOMIC);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2348  	if (!io_req) {
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2349  		spin_unlock_irqrestore=
(io_lock, flags);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2350  		goto fnic_device_reset=
_end;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2351  	}
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2352  	memset(io_req, 0, sizeo=
f(*io_req));
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2353  	io_req->port_id =3D rpo=
rt->port_id;
3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2354  	CMD_SP(reset_sc) =3D (c=
har *)io_req;
3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2355  =

5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2356  	io_req->dr_done =3D &tm=
_done;
3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2357  	CMD_STATE(reset_sc) =3D=
 FNIC_IOREQ_CMD_PENDING;
3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2358  	CMD_LR_STATUS(reset_sc)=
 =3D FCPIO_INVALID_CODE;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2359  	spin_unlock_irqrestore(=
io_lock, flags);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2360  =

03298552cba38f Hiral Patel       2013-02-12  2361  	FNIC_SCSI_DBG(KERN_DEBU=
G, fnic->lport->host, "TAG %x\n", tag);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2362  =

5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2363  	/*
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2364  	 * issue the device res=
et, if enqueue failed, clean up the ioreq
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2365  	 * and break assoc with=
 scsi cmd
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2366  	 */
3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2367  	if (fnic_queue_dr_io_re=
q(fnic, reset_sc, io_req)) {
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2368  		spin_lock_irqsave(io_l=
ock, flags);
3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2369  		io_req =3D (struct fni=
c_io_req *)CMD_SP(reset_sc);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2370  		if (io_req)
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2371  			io_req->dr_done =3D N=
ULL;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2372  		goto fnic_device_reset=
_clean;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2373  	}
03298552cba38f Hiral Patel       2013-02-12  2374  	spin_lock_irqsave(io_lo=
ck, flags);
3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2375  	CMD_FLAGS(reset_sc) |=
=3D FNIC_DEV_RST_ISSUED;
03298552cba38f Hiral Patel       2013-02-12  2376  	spin_unlock_irqrestore(=
io_lock, flags);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2377  =

5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2378  	/*
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2379  	 * Wait on the local co=
mpletion for LUN reset.  The io_req may be
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2380  	 * freed while we wait =
since we hold no lock.
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2381  	 */
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2382  	wait_for_completion_tim=
eout(&tm_done,
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2383  				    msecs_to_jiffies=
(FNIC_LUN_RESET_TIMEOUT));
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2384  =

5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2385  	spin_lock_irqsave(io_lo=
ck, flags);
3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2386  	io_req =3D (struct fnic=
_io_req *)CMD_SP(reset_sc);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2387  	if (!io_req) {
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2388  		spin_unlock_irqrestore=
(io_lock, flags);
03298552cba38f Hiral Patel       2013-02-12  2389  		FNIC_SCSI_DBG(KERN_DEB=
UG, fnic->lport->host,
3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2390  				"io_req is null tag =
0x%x sc 0x%p\n", tag, reset_sc);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2391  		goto fnic_device_reset=
_end;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2392  	}
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2393  	io_req->dr_done =3D NUL=
L;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2394  =

3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2395  	status =3D CMD_LR_STATU=
S(reset_sc);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2396  =

5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2397  	/*
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2398  	 * If lun reset not com=
pleted, bail out with failed. io_req
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2399  	 * gets cleaned up duri=
ng higher levels of EH
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2400  	 */
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2401  	if (status =3D=3D FCPIO=
_INVALID_CODE) {
67125b0287a9e6 Hiral Patel       2013-09-12  2402  		atomic64_inc(&reset_st=
ats->device_reset_timeouts);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2403  		FNIC_SCSI_DBG(KERN_DEB=
UG, fnic->lport->host,
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2404  			      "Device reset t=
imed out\n");
3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2405  		CMD_FLAGS(reset_sc) |=
=3D FNIC_DEV_RST_TIMED_OUT;
03298552cba38f Hiral Patel       2013-02-12  2406  		spin_unlock_irqrestore=
(io_lock, flags);
3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2407  		int_to_scsilun(sdev->l=
un, &fc_lun);
03298552cba38f Hiral Patel       2013-02-12  2408  		/*
1259c5dc752474 Sesidhar Beddel   2013-09-09  2409  		 * Issue abort and ter=
minate on device reset request.
1259c5dc752474 Sesidhar Beddel   2013-09-09  2410  		 * If q'ing of termina=
te fails, retry it after a delay.
03298552cba38f Hiral Patel       2013-02-12  2411  		 */
03298552cba38f Hiral Patel       2013-02-12  2412  		while (1) {
03298552cba38f Hiral Patel       2013-02-12  2413  			spin_lock_irqsave(io_=
lock, flags);
3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2414  			if (CMD_FLAGS(reset_s=
c) & FNIC_DEV_RST_TERM_ISSUED) {
03298552cba38f Hiral Patel       2013-02-12  2415  				spin_unlock_irqresto=
re(io_lock, flags);
03298552cba38f Hiral Patel       2013-02-12  2416  				break;
03298552cba38f Hiral Patel       2013-02-12  2417  			}
03298552cba38f Hiral Patel       2013-02-12  2418  			spin_unlock_irqrestor=
e(io_lock, flags);
03298552cba38f Hiral Patel       2013-02-12  2419  			if (fnic_queue_abort_=
io_req(fnic,
03298552cba38f Hiral Patel       2013-02-12  2420  				tag | FNIC_TAG_DEV_R=
ST,
03298552cba38f Hiral Patel       2013-02-12  2421  				FCPIO_ITMF_ABT_TASK_=
TERM,
03298552cba38f Hiral Patel       2013-02-12  2422  				fc_lun.scsi_lun, io_=
req)) {
03298552cba38f Hiral Patel       2013-02-12  2423  				wait_for_completion_=
timeout(&tm_done,
03298552cba38f Hiral Patel       2013-02-12  2424  				msecs_to_jiffies(FNI=
C_ABT_TERM_DELAY_TIMEOUT));
03298552cba38f Hiral Patel       2013-02-12  2425  			} else {
03298552cba38f Hiral Patel       2013-02-12  2426  				spin_lock_irqsave(io=
_lock, flags);
3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2427  				CMD_FLAGS(reset_sc) =
|=3D FNIC_DEV_RST_TERM_ISSUED;
3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2428  				CMD_STATE(reset_sc) =
=3D FNIC_IOREQ_ABTS_PENDING;
03298552cba38f Hiral Patel       2013-02-12  2429  				io_req->abts_done =
=3D &tm_done;
03298552cba38f Hiral Patel       2013-02-12  2430  				spin_unlock_irqresto=
re(io_lock, flags);
03298552cba38f Hiral Patel       2013-02-12  2431  				FNIC_SCSI_DBG(KERN_D=
EBUG, fnic->lport->host,
03298552cba38f Hiral Patel       2013-02-12  2432  				"Abort and terminate=
 issued on Device reset "
3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2433  				"tag 0x%x sc 0x%p\n"=
, tag, reset_sc);
03298552cba38f Hiral Patel       2013-02-12  2434  				break;
03298552cba38f Hiral Patel       2013-02-12  2435  			}
03298552cba38f Hiral Patel       2013-02-12  2436  		}
03298552cba38f Hiral Patel       2013-02-12  2437  		while (1) {
03298552cba38f Hiral Patel       2013-02-12  2438  			spin_lock_irqsave(io_=
lock, flags);
03298552cba38f Hiral Patel       2013-02-12  2439  			if (!(CMD_FLAGS(sc) &=
 FNIC_DEV_RST_DONE)) {
03298552cba38f Hiral Patel       2013-02-12  2440  				spin_unlock_irqresto=
re(io_lock, flags);
03298552cba38f Hiral Patel       2013-02-12  2441  				wait_for_completion_=
timeout(&tm_done,
03298552cba38f Hiral Patel       2013-02-12  2442  				msecs_to_jiffies(FNI=
C_LUN_RESET_TIMEOUT));
03298552cba38f Hiral Patel       2013-02-12  2443  				break;
03298552cba38f Hiral Patel       2013-02-12  2444  			} else {
3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2445  				io_req =3D (struct f=
nic_io_req *)CMD_SP(reset_sc);
03298552cba38f Hiral Patel       2013-02-12  2446  				io_req->abts_done =
=3D NULL;
03298552cba38f Hiral Patel       2013-02-12  2447  				goto fnic_device_res=
et_clean;
03298552cba38f Hiral Patel       2013-02-12  2448  			}
03298552cba38f Hiral Patel       2013-02-12  2449  		}
03298552cba38f Hiral Patel       2013-02-12  2450  	} else {
03298552cba38f Hiral Patel       2013-02-12  2451  		spin_unlock_irqrestore=
(io_lock, flags);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2452  	}
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2453  =

5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2454  	/* Completed, but not s=
uccessful, clean up the io_req, return fail */
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2455  	if (status !=3D FCPIO_S=
UCCESS) {
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2456  		spin_lock_irqsave(io_l=
ock, flags);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2457  		FNIC_SCSI_DBG(KERN_DEB=
UG,
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2458  			      fnic->lport->ho=
st,
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2459  			      "Device reset c=
ompleted - failed\n");
3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2460  		io_req =3D (struct fni=
c_io_req *)CMD_SP(reset_sc);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2461  		goto fnic_device_reset=
_clean;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2462  	}
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2463  =

5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2464  	/*
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2465  	 * Clean up any aborts =
on this lun that have still not
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2466  	 * completed. If any of=
 these fail, then LUN reset fails.
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2467  	 * clean_pending_aborts=
 cleans all cmds on this lun except
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2468  	 * the lun reset cmd. I=
f all cmds get cleaned, the lun reset
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2469  	 * succeeds
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2470  	 */
3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2471  	if (fnic_clean_pending_=
aborts(fnic, reset_sc)) {
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2472  		spin_lock_irqsave(io_l=
ock, flags);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2473  		io_req =3D (struct fni=
c_io_req *)CMD_SP(sc);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2474  		FNIC_SCSI_DBG(KERN_DEB=
UG, fnic->lport->host,
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2475  			      "Device reset f=
ailed"
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2476  			      " since could n=
ot abort all IOs\n");
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2477  		goto fnic_device_reset=
_clean;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2478  	}
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2479  =

5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2480  	/* Clean lun reset comm=
and */
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2481  	spin_lock_irqsave(io_lo=
ck, flags);
3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2482  	io_req =3D (struct fnic=
_io_req *)CMD_SP(reset_sc);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2483  	if (io_req)
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2484  		/* Completed, and succ=
essful */
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2485  		ret =3D SUCCESS;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2486  =

5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2487  fnic_device_reset_clean:
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2488  	if (io_req)
3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2489  		CMD_SP(reset_sc) =3D N=
ULL;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2490  =

5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2491  	spin_unlock_irqrestore(=
io_lock, flags);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2492  =

5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2493  	if (io_req) {
14eb5d905d16ec Hiral Patel       2013-02-12  2494  		start_time =3D io_req-=
>start_time;
3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2495  		fnic_release_ioreq_buf=
(fnic, io_req, reset_sc);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2496  		mempool_free(io_req, f=
nic->io_req_pool);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2497  	}
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2498  =

5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2499  fnic_device_reset_end:
3b695cc5f04ad6 Hannes Reinecke   2020-03-11 @2500  	FNIC_TRACE(fnic_device_=
reset, sdev->host->host_no,
3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2501  		   reset_sc->request->=
tag, reset_sc,
                                                                   ^^^^^^^^=
^^^^^^^^^
Unchecked dereference.

4d7007b49d523d Hiral Patel       2013-02-12  2502  		  jiffies_to_msecs(jif=
fies - start_time),
3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2503  		  0, ((u64)reset_sc->c=
mnd[0] << 32 |
4d7007b49d523d Hiral Patel       2013-02-12  2504  		  (u64)sc->cmnd[2] << =
24 | (u64)sc->cmnd[3] << 16 |
4d7007b49d523d Hiral Patel       2013-02-12  2505  		  (u64)sc->cmnd[4] << =
8 | sc->cmnd[5]),
4d7007b49d523d Hiral Patel       2013-02-12  2506  		  (((u64)CMD_FLAGS(sc)=
 << 32) | CMD_STATE(sc)));
4d7007b49d523d Hiral Patel       2013-02-12  2507  =

3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2508  	/* free internal comman=
d if it is allocated */
3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2509  	if (reset_sc)
3b695cc5f04ad6 Hannes Reinecke   2020-03-11  2510  		scsi_put_internal_cmd(=
reset_sc);
03298552cba38f Hiral Patel       2013-02-12  2511  =

5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2512  	FNIC_SCSI_DBG(KERN_DEBU=
G, fnic->lport->host,
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2513  		      "Returning from =
device reset %s\n",
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2514  		      (ret =3D=3D SUCC=
ESS) ?
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2515  		      "SUCCESS" : "FAI=
LED");
67125b0287a9e6 Hiral Patel       2013-09-12  2516  =

67125b0287a9e6 Hiral Patel       2013-09-12  2517  	if (ret =3D=3D FAILED)
67125b0287a9e6 Hiral Patel       2013-09-12  2518  		atomic64_inc(&reset_st=
ats->device_reset_failures);
67125b0287a9e6 Hiral Patel       2013-09-12  2519  =

5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2520  	return ret;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2521  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1037150609509380418==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
Zpc0nGXep6Kjy8nxmlQvR/8Ftq9i6clJAgA=
--===============1037150609509380418==--

