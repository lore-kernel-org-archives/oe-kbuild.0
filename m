Content-Type: multipart/mixed; boundary="===============6973886951971824515=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/misc/habanalabs/common/command_submission.c:2457 hl_cs_poll_fences() error: we previously assumed 'fence' could be null (see line 2430)
Date: Wed, 19 Jan 2022 01:09:18 +0800
Message-ID: <202201190048.qRDA3uFx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6973886951971824515==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ohad Sharabi <osharabi@habana.ai>
CC: Oded Gabbay <ogabbay@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   99613159ad749543621da8238acf1a122880144e
commit: e2558f0f84d85bfe2407b91d57798f133d8ad32a habanalabs: prevent wait i=
f CS in multi-CS list completed
date:   3 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 weeks ago
config: s390-randconfig-m031-20220117 (https://download.01.org/0day-ci/arch=
ive/20220119/202201190048.qRDA3uFx-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/misc/habanalabs/common/command_submission.c:2457 hl_cs_poll_fences(=
) error: we previously assumed 'fence' could be null (see line 2430)

vim +/fence +2457 drivers/misc/habanalabs/common/command_submission.c

eff6f4a0e70b7b drivers/misc/habanalabs/command_submission.c        Oded Gab=
bay   2019-02-16  2367  =

215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2368  /*
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2369   * hl_cs_poll_fences - iterate CS fences to check f=
or CS completion
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2370   *
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2371   * @mcs_data: multi-CS internal data
e2558f0f84d85b drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-12-07  2372   * @mcs_compl: multi-CS completion structure
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2373   *
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2374   * @return 0 on success, otherwise non 0 error code
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2375   *
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2376   * The function iterates on all CS sequence in the =
list and set bit in
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2377   * completion_bitmap for each completed CS.
e2558f0f84d85b drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-12-07  2378   * While iterating, the function sets the stream ma=
p of each fence in the fence
e2558f0f84d85b drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-12-07  2379   * array in the completion QID stream map to be use=
d by CSs to perform
e2558f0f84d85b drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-12-07  2380   * completion to the multi-CS context.
e2558f0f84d85b drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-12-07  2381   * This function shall be called after taking conte=
xt ref
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2382   */
e2558f0f84d85b drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-12-07  2383  static int hl_cs_poll_fences(struct multi_cs_data *=
mcs_data, struct multi_cs_completion *mcs_compl)
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2384  {
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2385  	struct hl_fence **fence_ptr =3D mcs_data->fence_ar=
r;
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2386  	struct hl_device *hdev =3D mcs_data->ctx->hdev;
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2387  	int i, rc, arr_len =3D mcs_data->arr_len;
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2388  	u64 *seq_arr =3D mcs_data->seq_arr;
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2389  	ktime_t max_ktime, first_cs_time;
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2390  	enum hl_cs_wait_status status;
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2391  =

215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2392  	memset(fence_ptr, 0, arr_len * sizeof(*fence_ptr));
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2393  =

215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2394  	/* get all fences under the same lock */
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2395  	rc =3D hl_ctx_get_fences(mcs_data->ctx, seq_arr, f=
ence_ptr, arr_len);
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2396  	if (rc)
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2397  		return rc;
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2398  =

e2558f0f84d85b drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-12-07  2399  	/*
e2558f0f84d85b drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-12-07  2400  	 * re-initialize the completion here to handle 2 p=
ossible cases:
e2558f0f84d85b drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-12-07  2401  	 * 1. CS will complete the multi-CS prior clearing=
 the completion. in which
e2558f0f84d85b drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-12-07  2402  	 *    case the fence iteration is guaranteed to ca=
tch the CS completion.
e2558f0f84d85b drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-12-07  2403  	 * 2. the completion will occur after re-init of t=
he completion.
e2558f0f84d85b drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-12-07  2404  	 *    in which case we will wake up immediately in=
 wait_for_completion.
e2558f0f84d85b drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-12-07  2405  	 */
e2558f0f84d85b drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-12-07  2406  	reinit_completion(&mcs_compl->completion);
e2558f0f84d85b drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-12-07  2407  =

215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2408  	/*
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2409  	 * set to maximum time to verify timestamp is vali=
d: if at the end
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2410  	 * this value is maintained- no timestamp was upda=
ted
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2411  	 */
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2412  	max_ktime =3D ktime_set(KTIME_SEC_MAX, 0);
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2413  	first_cs_time =3D max_ktime;
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2414  =

215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2415  	for (i =3D 0; i < arr_len; i++, fence_ptr++) {
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2416  		struct hl_fence *fence =3D *fence_ptr;
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2417  =

e2558f0f84d85b drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-12-07  2418  		/*
e2558f0f84d85b drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-12-07  2419  		 * In order to prevent case where we wait until t=
imeout even though a CS associated
e2558f0f84d85b drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-12-07  2420  		 * with the multi-CS actually completed we do thi=
ngs in the below order:
e2558f0f84d85b drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-12-07  2421  		 * 1. for each fence set it's QID map in the mult=
i-CS completion QID map. This way
e2558f0f84d85b drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-12-07  2422  		 *    any CS can, potentially, complete the multi=
 CS for the specific QID (note
e2558f0f84d85b drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-12-07  2423  		 *    that once completion is initialized, callin=
g complete* and then wait on the
e2558f0f84d85b drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-12-07  2424  		 *    completion will cause it to return@once)
e2558f0f84d85b drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-12-07  2425  		 * 2. only after allowing multi-CS completion for=
 the specific QID we check whether
e2558f0f84d85b drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-12-07  2426  		 *    the specific CS already completed (and thus=
 the wait for completion part will
e2558f0f84d85b drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-12-07  2427  		 *    be skipped). if the CS not completed it is =
guaranteed that completing CS will
e2558f0f84d85b drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-12-07  2428  		 *    wake up the completion.
e2558f0f84d85b drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-12-07  2429  		 */
e2558f0f84d85b drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-12-07 @2430  		if (fence)
e2558f0f84d85b drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-12-07  2431  			mcs_compl->stream_master_qid_map |=3D fence->str=
eam_master_qid_map;
e2558f0f84d85b drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-12-07  2432  =

215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2433  		/*
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2434  		 * function won't sleep as it is called with time=
out 0 (i.e.
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2435  		 * poll the fence)
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2436  		 */
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2437  		rc =3D hl_wait_for_fence(mcs_data->ctx, seq_arr[i=
], fence,
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2438  						&status, 0, NULL);
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2439  		if (rc) {
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2440  			dev_err(hdev->dev,
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2441  				"wait_for_fence error :%d for CS seq %llu\n",
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2442  								rc, seq_arr[i]);
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2443  			break;
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2444  		}
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2445  =

b2faac3887df87 drivers/misc/habanalabs/common/command_submission.c Dani Lib=
erman 2021-10-12  2446  		switch (status) {
b2faac3887df87 drivers/misc/habanalabs/common/command_submission.c Dani Lib=
erman 2021-10-12  2447  		case CS_WAIT_STATUS_BUSY:
e2558f0f84d85b drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-12-07  2448  			/* CS did not finished, QID to wait on already s=
tored */
b2faac3887df87 drivers/misc/habanalabs/common/command_submission.c Dani Lib=
erman 2021-10-12  2449  			break;
b2faac3887df87 drivers/misc/habanalabs/common/command_submission.c Dani Lib=
erman 2021-10-12  2450  		case CS_WAIT_STATUS_COMPLETED:
ea6eb91c09cd4f drivers/misc/habanalabs/common/command_submission.c Dani Lib=
erman 2021-10-03  2451  			/*
ea6eb91c09cd4f drivers/misc/habanalabs/common/command_submission.c Dani Lib=
erman 2021-10-03  2452  			 * Using mcs_handling_done to avoid possibility =
of mcs_data
ea6eb91c09cd4f drivers/misc/habanalabs/common/command_submission.c Dani Lib=
erman 2021-10-03  2453  			 * returns to user indicating CS completed befor=
e it finished
ea6eb91c09cd4f drivers/misc/habanalabs/common/command_submission.c Dani Lib=
erman 2021-10-03  2454  			 * all of its mcs handling, to avoid race the ne=
xt time the
ea6eb91c09cd4f drivers/misc/habanalabs/common/command_submission.c Dani Lib=
erman 2021-10-03  2455  			 * user waits for mcs.
ea6eb91c09cd4f drivers/misc/habanalabs/common/command_submission.c Dani Lib=
erman 2021-10-03  2456  			 */
b2faac3887df87 drivers/misc/habanalabs/common/command_submission.c Dani Lib=
erman 2021-10-12 @2457  			if (!fence->mcs_handling_done)
b2faac3887df87 drivers/misc/habanalabs/common/command_submission.c Dani Lib=
erman 2021-10-12  2458  				break;
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2459  =

215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2460  			mcs_data->completion_bitmap |=3D BIT(i);
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2461  			/*
b2faac3887df87 drivers/misc/habanalabs/common/command_submission.c Dani Lib=
erman 2021-10-12  2462  			 * For all completed CSs we take the earliest ti=
mestamp.
b2faac3887df87 drivers/misc/habanalabs/common/command_submission.c Dani Lib=
erman 2021-10-12  2463  			 * For this we have to validate that the timesta=
mp is
b2faac3887df87 drivers/misc/habanalabs/common/command_submission.c Dani Lib=
erman 2021-10-12  2464  			 * earliest of all timestamps so far.
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2465  			 */
b2faac3887df87 drivers/misc/habanalabs/common/command_submission.c Dani Lib=
erman 2021-10-12  2466  			if (mcs_data->update_ts &&
b2faac3887df87 drivers/misc/habanalabs/common/command_submission.c Dani Lib=
erman 2021-10-12  2467  					(ktime_compare(fence->timestamp, first_cs_time=
) < 0))
b2faac3887df87 drivers/misc/habanalabs/common/command_submission.c Dani Lib=
erman 2021-10-12  2468  				first_cs_time =3D fence->timestamp;
b2faac3887df87 drivers/misc/habanalabs/common/command_submission.c Dani Lib=
erman 2021-10-12  2469  			break;
b2faac3887df87 drivers/misc/habanalabs/common/command_submission.c Dani Lib=
erman 2021-10-12  2470  		case CS_WAIT_STATUS_GONE:
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2471  			mcs_data->update_ts =3D false;
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2472  			mcs_data->gone_cs =3D true;
b2faac3887df87 drivers/misc/habanalabs/common/command_submission.c Dani Lib=
erman 2021-10-12  2473  			/*
b2faac3887df87 drivers/misc/habanalabs/common/command_submission.c Dani Lib=
erman 2021-10-12  2474  			 * It is possible to get an old sequence numbers=
 from user
b2faac3887df87 drivers/misc/habanalabs/common/command_submission.c Dani Lib=
erman 2021-10-12  2475  			 * which related to already completed CSs and th=
eir fences
b2faac3887df87 drivers/misc/habanalabs/common/command_submission.c Dani Lib=
erman 2021-10-12  2476  			 * already gone. In this case, CS set as complet=
ed but
b2faac3887df87 drivers/misc/habanalabs/common/command_submission.c Dani Lib=
erman 2021-10-12  2477  			 * no need to consider its QID for mcs completio=
n.
b2faac3887df87 drivers/misc/habanalabs/common/command_submission.c Dani Lib=
erman 2021-10-12  2478  			 */
b2faac3887df87 drivers/misc/habanalabs/common/command_submission.c Dani Lib=
erman 2021-10-12  2479  			mcs_data->completion_bitmap |=3D BIT(i);
b2faac3887df87 drivers/misc/habanalabs/common/command_submission.c Dani Lib=
erman 2021-10-12  2480  			break;
b2faac3887df87 drivers/misc/habanalabs/common/command_submission.c Dani Lib=
erman 2021-10-12  2481  		default:
b2faac3887df87 drivers/misc/habanalabs/common/command_submission.c Dani Lib=
erman 2021-10-12  2482  			dev_err(hdev->dev, "Invalid fence status\n");
b2faac3887df87 drivers/misc/habanalabs/common/command_submission.c Dani Lib=
erman 2021-10-12  2483  			return -EINVAL;
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2484  		}
b2faac3887df87 drivers/misc/habanalabs/common/command_submission.c Dani Lib=
erman 2021-10-12  2485  =

215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2486  	}
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2487  =

215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2488  	hl_fences_put(mcs_data->fence_arr, arr_len);
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2489  =

215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2490  	if (mcs_data->update_ts &&
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2491  			(ktime_compare(first_cs_time, max_ktime) !=3D 0))
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2492  		mcs_data->timestamp =3D ktime_to_ns(first_cs_time=
);
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2493  =

215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2494  	return rc;
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2495  }
215f0c1775d550 drivers/misc/habanalabs/common/command_submission.c Ohad Sha=
rabi  2021-06-14  2496  =


:::::: The code at line 2457 was first introduced by commit
:::::: b2faac3887df87a6e4bc3356280ea35dc7459c0b habanalabs: refactor fence =
handling in hl_cs_poll_fences

:::::: TO: Dani Liberman <dliberman@habana.ai>
:::::: CC: Oded Gabbay <ogabbay@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6973886951971824515==--

