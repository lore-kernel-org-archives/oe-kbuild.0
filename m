Content-Type: multipart/mixed; boundary="===============7488919290126499103=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ogabbay:habanalabs-next 61/62] drivers/misc/habanalabs/common/command_submission.c:2457 hl_cs_poll_fences() error: we previously assumed 'fence' could be null (see line 2430)
Date: Wed, 15 Dec 2021 09:32:41 +0800
Message-ID: <202112150909.IO2IGBpM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7488919290126499103==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ohad Sharabi <osharabi@habana.ai>
CC: Oded Gabbay <ogabbay@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git h=
abanalabs-next
head:   dd749d462678f0043da58864dee31458245d6f77
commit: b73780d6ccb74b0f85ddca84e1d9f0b73203feb4 [61/62] habanalabs: preven=
t wait if CS in multi-CS list completed
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: i386-randconfig-m021-20211214 (https://download.01.org/0day-ci/arch=
ive/20211215/202112150909.IO2IGBpM-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/misc/habanalabs/common/command_submission.c:2457 hl_cs_poll_fences(=
) error: we previously assumed 'fence' could be null (see line 2430)

vim +/fence +2457 drivers/misc/habanalabs/common/command_submission.c

eff6f4a0e70b7bc drivers/misc/habanalabs/command_submission.c        Oded Ga=
bbay   2019-02-16  2367  =

215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2368  /*
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2369   * hl_cs_poll_fences - iterate CS fences to check =
for CS completion
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2370   *
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2371   * @mcs_data: multi-CS internal data
b73780d6ccb74b0 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-12-07  2372   * @mcs_compl: multi-CS completion structure
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2373   *
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2374   * @return 0 on success, otherwise non 0 error code
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2375   *
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2376   * The function iterates on all CS sequence in the=
 list and set bit in
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2377   * completion_bitmap for each completed CS.
b73780d6ccb74b0 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-12-07  2378   * While iterating, the function sets the stream m=
ap of each fence in the fence
b73780d6ccb74b0 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-12-07  2379   * array in the completion QID stream map to be us=
ed by CSs to perform
b73780d6ccb74b0 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-12-07  2380   * completion to the multi-CS context.
b73780d6ccb74b0 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-12-07  2381   * This function shall be called after taking cont=
ext ref
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2382   */
b73780d6ccb74b0 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-12-07  2383  static int hl_cs_poll_fences(struct multi_cs_data =
*mcs_data, struct multi_cs_completion *mcs_compl)
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2384  {
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2385  	struct hl_fence **fence_ptr =3D mcs_data->fence_a=
rr;
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2386  	struct hl_device *hdev =3D mcs_data->ctx->hdev;
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2387  	int i, rc, arr_len =3D mcs_data->arr_len;
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2388  	u64 *seq_arr =3D mcs_data->seq_arr;
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2389  	ktime_t max_ktime, first_cs_time;
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2390  	enum hl_cs_wait_status status;
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2391  =

215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2392  	memset(fence_ptr, 0, arr_len * sizeof(*fence_ptr)=
);
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2393  =

215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2394  	/* get all fences under the same lock */
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2395  	rc =3D hl_ctx_get_fences(mcs_data->ctx, seq_arr, =
fence_ptr, arr_len);
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2396  	if (rc)
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2397  		return rc;
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2398  =

b73780d6ccb74b0 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-12-07  2399  	/*
b73780d6ccb74b0 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-12-07  2400  	 * re-initialize the completion here to handle 2 =
possible cases:
b73780d6ccb74b0 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-12-07  2401  	 * 1. CS will complete the multi-CS prior clearin=
g the completion. in which
b73780d6ccb74b0 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-12-07  2402  	 *    case the fence iteration is guaranteed to c=
atch the CS completion.
b73780d6ccb74b0 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-12-07  2403  	 * 2. the completion will occur after re-init of =
the completion.
b73780d6ccb74b0 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-12-07  2404  	 *    in which case we will wake up immediately i=
n wait_for_completion.
b73780d6ccb74b0 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-12-07  2405  	 */
b73780d6ccb74b0 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-12-07  2406  	reinit_completion(&mcs_compl->completion);
b73780d6ccb74b0 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-12-07  2407  =

215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2408  	/*
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2409  	 * set to maximum time to verify timestamp is val=
id: if at the end
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2410  	 * this value is maintained- no timestamp was upd=
ated
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2411  	 */
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2412  	max_ktime =3D ktime_set(KTIME_SEC_MAX, 0);
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2413  	first_cs_time =3D max_ktime;
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2414  =

215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2415  	for (i =3D 0; i < arr_len; i++, fence_ptr++) {
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2416  		struct hl_fence *fence =3D *fence_ptr;
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2417  =

b73780d6ccb74b0 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-12-07  2418  		/*
b73780d6ccb74b0 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-12-07  2419  		 * In order to prevent case where we wait until =
timeout even though a CS associated
b73780d6ccb74b0 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-12-07  2420  		 * with the multi-CS actually completed we do th=
ings in the below order:
b73780d6ccb74b0 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-12-07  2421  		 * 1. for each fence set it's QID map in the mul=
ti-CS completion QID map. This way
b73780d6ccb74b0 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-12-07  2422  		 *    any CS can, potentially, complete the mult=
i CS for the specific QID (note
b73780d6ccb74b0 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-12-07  2423  		 *    that once completion is initialized, calli=
ng complete* and then wait on the
b73780d6ccb74b0 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-12-07  2424  		 *    completion will cause it to return@once)
b73780d6ccb74b0 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-12-07  2425  		 * 2. only after allowing multi-CS completion fo=
r the specific QID we check whether
b73780d6ccb74b0 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-12-07  2426  		 *    the specific CS already completed (and thu=
s the wait for completion part will
b73780d6ccb74b0 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-12-07  2427  		 *    be skipped). if the CS not completed it is=
 guaranteed that completing CS will
b73780d6ccb74b0 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-12-07  2428  		 *    wake up the completion.
b73780d6ccb74b0 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-12-07  2429  		 */
b73780d6ccb74b0 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-12-07 @2430  		if (fence)
b73780d6ccb74b0 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-12-07  2431  			mcs_compl->stream_master_qid_map |=3D fence->st=
ream_master_qid_map;
b73780d6ccb74b0 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-12-07  2432  =

215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2433  		/*
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2434  		 * function won't sleep as it is called with tim=
eout 0 (i.e.
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2435  		 * poll the fence)
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2436  		 */
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2437  		rc =3D hl_wait_for_fence(mcs_data->ctx, seq_arr[=
i], fence,
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2438  						&status, 0, NULL);
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2439  		if (rc) {
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2440  			dev_err(hdev->dev,
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2441  				"wait_for_fence error :%d for CS seq %llu\n",
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2442  								rc, seq_arr[i]);
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2443  			break;
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2444  		}
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2445  =

b2faac3887df87a drivers/misc/habanalabs/common/command_submission.c Dani Li=
berman 2021-10-12  2446  		switch (status) {
b2faac3887df87a drivers/misc/habanalabs/common/command_submission.c Dani Li=
berman 2021-10-12  2447  		case CS_WAIT_STATUS_BUSY:
b73780d6ccb74b0 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-12-07  2448  			/* CS did not finished, QID to wait on already =
stored */
b2faac3887df87a drivers/misc/habanalabs/common/command_submission.c Dani Li=
berman 2021-10-12  2449  			break;
b2faac3887df87a drivers/misc/habanalabs/common/command_submission.c Dani Li=
berman 2021-10-12  2450  		case CS_WAIT_STATUS_COMPLETED:
ea6eb91c09cd4f2 drivers/misc/habanalabs/common/command_submission.c Dani Li=
berman 2021-10-03  2451  			/*
ea6eb91c09cd4f2 drivers/misc/habanalabs/common/command_submission.c Dani Li=
berman 2021-10-03  2452  			 * Using mcs_handling_done to avoid possibility=
 of mcs_data
ea6eb91c09cd4f2 drivers/misc/habanalabs/common/command_submission.c Dani Li=
berman 2021-10-03  2453  			 * returns to user indicating CS completed befo=
re it finished
ea6eb91c09cd4f2 drivers/misc/habanalabs/common/command_submission.c Dani Li=
berman 2021-10-03  2454  			 * all of its mcs handling, to avoid race the n=
ext time the
ea6eb91c09cd4f2 drivers/misc/habanalabs/common/command_submission.c Dani Li=
berman 2021-10-03  2455  			 * user waits for mcs.
ea6eb91c09cd4f2 drivers/misc/habanalabs/common/command_submission.c Dani Li=
berman 2021-10-03  2456  			 */
b2faac3887df87a drivers/misc/habanalabs/common/command_submission.c Dani Li=
berman 2021-10-12 @2457  			if (!fence->mcs_handling_done)
b2faac3887df87a drivers/misc/habanalabs/common/command_submission.c Dani Li=
berman 2021-10-12  2458  				break;
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2459  =

215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2460  			mcs_data->completion_bitmap |=3D BIT(i);
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2461  			/*
b2faac3887df87a drivers/misc/habanalabs/common/command_submission.c Dani Li=
berman 2021-10-12  2462  			 * For all completed CSs we take the earliest t=
imestamp.
b2faac3887df87a drivers/misc/habanalabs/common/command_submission.c Dani Li=
berman 2021-10-12  2463  			 * For this we have to validate that the timest=
amp is
b2faac3887df87a drivers/misc/habanalabs/common/command_submission.c Dani Li=
berman 2021-10-12  2464  			 * earliest of all timestamps so far.
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2465  			 */
b2faac3887df87a drivers/misc/habanalabs/common/command_submission.c Dani Li=
berman 2021-10-12  2466  			if (mcs_data->update_ts &&
b2faac3887df87a drivers/misc/habanalabs/common/command_submission.c Dani Li=
berman 2021-10-12  2467  					(ktime_compare(fence->timestamp, first_cs_tim=
e) < 0))
b2faac3887df87a drivers/misc/habanalabs/common/command_submission.c Dani Li=
berman 2021-10-12  2468  				first_cs_time =3D fence->timestamp;
b2faac3887df87a drivers/misc/habanalabs/common/command_submission.c Dani Li=
berman 2021-10-12  2469  			break;
b2faac3887df87a drivers/misc/habanalabs/common/command_submission.c Dani Li=
berman 2021-10-12  2470  		case CS_WAIT_STATUS_GONE:
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2471  			mcs_data->update_ts =3D false;
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2472  			mcs_data->gone_cs =3D true;
b2faac3887df87a drivers/misc/habanalabs/common/command_submission.c Dani Li=
berman 2021-10-12  2473  			/*
b2faac3887df87a drivers/misc/habanalabs/common/command_submission.c Dani Li=
berman 2021-10-12  2474  			 * It is possible to get an old sequence number=
s from user
b2faac3887df87a drivers/misc/habanalabs/common/command_submission.c Dani Li=
berman 2021-10-12  2475  			 * which related to already completed CSs and t=
heir fences
b2faac3887df87a drivers/misc/habanalabs/common/command_submission.c Dani Li=
berman 2021-10-12  2476  			 * already gone. In this case, CS set as comple=
ted but
b2faac3887df87a drivers/misc/habanalabs/common/command_submission.c Dani Li=
berman 2021-10-12  2477  			 * no need to consider its QID for mcs completi=
on.
b2faac3887df87a drivers/misc/habanalabs/common/command_submission.c Dani Li=
berman 2021-10-12  2478  			 */
b2faac3887df87a drivers/misc/habanalabs/common/command_submission.c Dani Li=
berman 2021-10-12  2479  			mcs_data->completion_bitmap |=3D BIT(i);
b2faac3887df87a drivers/misc/habanalabs/common/command_submission.c Dani Li=
berman 2021-10-12  2480  			break;
b2faac3887df87a drivers/misc/habanalabs/common/command_submission.c Dani Li=
berman 2021-10-12  2481  		default:
b2faac3887df87a drivers/misc/habanalabs/common/command_submission.c Dani Li=
berman 2021-10-12  2482  			dev_err(hdev->dev, "Invalid fence status\n");
b2faac3887df87a drivers/misc/habanalabs/common/command_submission.c Dani Li=
berman 2021-10-12  2483  			return -EINVAL;
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2484  		}
b2faac3887df87a drivers/misc/habanalabs/common/command_submission.c Dani Li=
berman 2021-10-12  2485  =

215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2486  	}
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2487  =

215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2488  	hl_fences_put(mcs_data->fence_arr, arr_len);
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2489  =

215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2490  	if (mcs_data->update_ts &&
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2491  			(ktime_compare(first_cs_time, max_ktime) !=3D 0=
))
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2492  		mcs_data->timestamp =3D ktime_to_ns(first_cs_tim=
e);
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2493  =

215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2494  	return rc;
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2495  }
215f0c1775d5506 drivers/misc/habanalabs/common/command_submission.c Ohad Sh=
arabi  2021-06-14  2496  =


:::::: The code at line 2457 was first introduced by commit
:::::: b2faac3887df87a6e4bc3356280ea35dc7459c0b habanalabs: refactor fence =
handling in hl_cs_poll_fences

:::::: TO: Dani Liberman <dliberman@habana.ai>
:::::: CC: Oded Gabbay <ogabbay@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7488919290126499103==--

