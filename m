Content-Type: multipart/mixed; boundary="===============9003148286178326381=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-stable-rc:linux-4.19.y 6833/9999] drivers/net/wireless/intel/iwlwifi/mvm/sta.c:2573:23: sparse: sparse: context imbalance in 'iwl_mvm_sta_tx_agg_start' - different lock contexts for basic block
Date: Mon, 21 Sep 2020 20:24:09 +0800
Message-ID: <202009212059.bTs9yq3l%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9003148286178326381==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Mordechay Goodstein <mordechay.goodstein@intel.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Luca Coelho <luciano.coelho@intel.com>
CC: Sasha Levin <alexander.levin@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-4.19.y
head:   e864f43593ccf9180c61738abdf1c1dde091367d
commit: 5ee7911e8e17afb4541096c6e98ffa61190338b3 [6833/9999] iwlwifi: mvm: =
avoid possible access out of array.
:::::: branch date: 3 months ago
:::::: commit date: 8 months ago
config: i386-randconfig-s031-20200921 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.2-201-g24bdaac6-dirty
        git checkout 5ee7911e8e17afb4541096c6e98ffa61190338b3
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=
=3Di386 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/net/wireless/intel/iwlwifi/mvm/sta.c: note: in included file (th=
rough drivers/net/wireless/intel/iwlwifi/mvm/..//fw/img.h, drivers/net/wire=
less/intel/iwlwifi/mvm/..//iwl-trans.h, ...):
   drivers/net/wireless/intel/iwlwifi/mvm/..//fw/file.h:286:19: sparse: spa=
rse: mixed bitwiseness
   drivers/net/wireless/intel/iwlwifi/mvm/..//fw/file.h:405:19: sparse: spa=
rse: mixed bitwiseness
>> drivers/net/wireless/intel/iwlwifi/mvm/sta.c:2573:23: sparse: sparse: co=
ntext imbalance in 'iwl_mvm_sta_tx_agg_start' - different lock contexts for=
 basic block
   In file included from drivers/net/wireless/intel/iwlwifi/mvm/../iwl-tran=
s.h:76,
                    from drivers/net/wireless/intel/iwlwifi/mvm/mvm.h:83,
                    from drivers/net/wireless/intel/iwlwifi/mvm/sta.c:71:
   drivers/net/wireless/intel/iwlwifi/mvm/../iwl-config.h:472:36: warning: =
'iwl_csr_v2' defined but not used [-Wunused-const-variable=3D]
     472 | static const struct iwl_csr_params iwl_csr_v2 =3D {
         |                                    ^~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/mvm/../iwl-config.h:457:36: warning: =
'iwl_csr_v1' defined but not used [-Wunused-const-variable=3D]
     457 | static const struct iwl_csr_params iwl_csr_v1 =3D {
         |                                    ^~~~~~~~~~

# https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.gi=
t/commit/?id=3D5ee7911e8e17afb4541096c6e98ffa61190338b3
git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/=
git/stable/linux-stable-rc.git
git fetch --no-tags linux-stable-rc linux-4.19.y
git checkout 5ee7911e8e17afb4541096c6e98ffa61190338b3
vim +/iwl_mvm_sta_tx_agg_start +2573 drivers/net/wireless/intel/iwlwifi/mvm=
/sta.c

3e56eadfb6a1f2 drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-02-15  2458  =

8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-01-24  2459  int iwl_mvm_sta_tx_agg_start(struct iwl_mvm *mvm, st=
ruct ieee80211_vif *vif,
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-01-24  2460  			     struct ieee80211_sta *sta, u16 tid, u16 *ssn)
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-01-24  2461  {
5b577a90fb3d86 drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-11-14  2462  	struct iwl_mvm_sta *mvmsta =3D iwl_mvm_sta_from_mac=
80211(sta);
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-01-24  2463  	struct iwl_mvm_tid_data *tid_data;
dd32162da4e5b3 drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2017-04-05  2464  	u16 normalized_ssn;
5ee7911e8e17af drivers/net/wireless/intel/iwlwifi/mvm/sta.c Mordechay Goods=
tein 2018-10-21  2465  	u16 txq_id;
4ecafae9e56802 drivers/net/wireless/iwlwifi/mvm/sta.c       Liad Kaufman   =
     2015-07-14  2466  	int ret;
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-01-24  2467  =

8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-01-24  2468  	if (WARN_ON_ONCE(tid >=3D IWL_MAX_TID_COUNT))
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-01-24  2469  		return -EINVAL;
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-01-24  2470  =

bd800e41a3de5c drivers/net/wireless/intel/iwlwifi/mvm/sta.c Naftali Goldste=
in   2017-08-28  2471  	if (mvmsta->tid_data[tid].state !=3D IWL_AGG_QUEUED=
 &&
bd800e41a3de5c drivers/net/wireless/intel/iwlwifi/mvm/sta.c Naftali Goldste=
in   2017-08-28  2472  	    mvmsta->tid_data[tid].state !=3D IWL_AGG_OFF) {
bd800e41a3de5c drivers/net/wireless/intel/iwlwifi/mvm/sta.c Naftali Goldste=
in   2017-08-28  2473  		IWL_ERR(mvm,
bd800e41a3de5c drivers/net/wireless/intel/iwlwifi/mvm/sta.c Naftali Goldste=
in   2017-08-28  2474  			"Start AGG when state is not IWL_AGG_QUEUED or IW=
L_AGG_OFF %d!\n",
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-01-24  2475  			mvmsta->tid_data[tid].state);
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-01-24  2476  		return -ENXIO;
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-01-24  2477  	}
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-01-24  2478  =

8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-01-24  2479  	lockdep_assert_held(&mvm->mutex);
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-01-24  2480  =

bd8f3fc613919b drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2018-01-17  2481  	if (mvmsta->tid_data[tid].txq_id =3D=3D IWL_MVM_INV=
ALID_QUEUE &&
bd8f3fc613919b drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2018-01-17  2482  	    iwl_mvm_has_new_tx_api(mvm)) {
bd8f3fc613919b drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2018-01-17  2483  		u8 ac =3D tid_to_mac80211_ac[tid];
bd8f3fc613919b drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2018-01-17  2484  =

bd8f3fc613919b drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2018-01-17  2485  		ret =3D iwl_mvm_sta_alloc_queue_tvqm(mvm, sta, ac,=
 tid);
bd8f3fc613919b drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2018-01-17  2486  		if (ret)
bd8f3fc613919b drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2018-01-17  2487  			return ret;
bd8f3fc613919b drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2018-01-17  2488  	}
bd8f3fc613919b drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2018-01-17  2489  =

b2492501d234ef drivers/net/wireless/iwlwifi/mvm/sta.c       Arik Nemtsov   =
     2014-03-13  2490  	spin_lock_bh(&mvmsta->lock);
b2492501d234ef drivers/net/wireless/iwlwifi/mvm/sta.c       Arik Nemtsov   =
     2014-03-13  2491  =

b2492501d234ef drivers/net/wireless/iwlwifi/mvm/sta.c       Arik Nemtsov   =
     2014-03-13  2492  	/* possible race condition - we entered D0i3 while =
starting agg */
b2492501d234ef drivers/net/wireless/iwlwifi/mvm/sta.c       Arik Nemtsov   =
     2014-03-13  2493  	if (test_bit(IWL_MVM_STATUS_IN_D0I3, &mvm->status))=
 {
b2492501d234ef drivers/net/wireless/iwlwifi/mvm/sta.c       Arik Nemtsov   =
     2014-03-13  2494  		spin_unlock_bh(&mvmsta->lock);
b2492501d234ef drivers/net/wireless/iwlwifi/mvm/sta.c       Arik Nemtsov   =
     2014-03-13  2495  		IWL_ERR(mvm, "Entered D0i3 while starting Tx agg\n=
");
b2492501d234ef drivers/net/wireless/iwlwifi/mvm/sta.c       Arik Nemtsov   =
     2014-03-13  2496  		return -EIO;
b2492501d234ef drivers/net/wireless/iwlwifi/mvm/sta.c       Arik Nemtsov   =
     2014-03-13  2497  	}
b2492501d234ef drivers/net/wireless/iwlwifi/mvm/sta.c       Arik Nemtsov   =
     2014-03-13  2498  =

9f9af3d7d303a5 drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2015-12-23  2499  	spin_lock(&mvm->queue_info_lock);
4ecafae9e56802 drivers/net/wireless/iwlwifi/mvm/sta.c       Liad Kaufman   =
     2015-07-14  2500  =

cf961e16620f88 drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2015-08-13  2501  	/*
cf961e16620f88 drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2015-08-13  2502  	 * Note the possible cases:
4a6d2e525b43eb drivers/net/wireless/intel/iwlwifi/mvm/sta.c Avraham Stern  =
     2018-03-05  2503  	 *  1. An enabled TXQ - TXQ needs to become agg'ed
4a6d2e525b43eb drivers/net/wireless/intel/iwlwifi/mvm/sta.c Avraham Stern  =
     2018-03-05  2504  	 *  2. The TXQ hasn't yet been enabled, so find a f=
ree one and mark
4a6d2e525b43eb drivers/net/wireless/intel/iwlwifi/mvm/sta.c Avraham Stern  =
     2018-03-05  2505  	 *	it as reserved
cf961e16620f88 drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2015-08-13  2506  	 */
cf961e16620f88 drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2015-08-13  2507  	txq_id =3D mvmsta->tid_data[tid].txq_id;
34e10860ae8dc8 drivers/net/wireless/intel/iwlwifi/mvm/sta.c Sara Sharon    =
     2017-02-23  2508  	if (txq_id =3D=3D IWL_MVM_INVALID_QUEUE) {
5ee7911e8e17af drivers/net/wireless/intel/iwlwifi/mvm/sta.c Mordechay Goods=
tein 2018-10-21  2509  		ret =3D iwl_mvm_find_free_queue(mvm, mvmsta->sta_i=
d,
c8f54701bdbfcc drivers/net/wireless/intel/iwlwifi/mvm/sta.c Johannes Berg  =
     2017-06-19  2510  					      IWL_MVM_DQA_MIN_DATA_QUEUE,
c8f54701bdbfcc drivers/net/wireless/intel/iwlwifi/mvm/sta.c Johannes Berg  =
     2017-06-19  2511  					      IWL_MVM_DQA_MAX_DATA_QUEUE);
5ee7911e8e17af drivers/net/wireless/intel/iwlwifi/mvm/sta.c Mordechay Goods=
tein 2018-10-21  2512  		if (ret < 0) {
4ecafae9e56802 drivers/net/wireless/iwlwifi/mvm/sta.c       Liad Kaufman   =
     2015-07-14  2513  			IWL_ERR(mvm, "Failed to allocate agg queue\n");
4ecafae9e56802 drivers/net/wireless/iwlwifi/mvm/sta.c       Liad Kaufman   =
     2015-07-14  2514  			goto release_locks;
4ecafae9e56802 drivers/net/wireless/iwlwifi/mvm/sta.c       Liad Kaufman   =
     2015-07-14  2515  		}
cf961e16620f88 drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2015-08-13  2516  =

5ee7911e8e17af drivers/net/wireless/intel/iwlwifi/mvm/sta.c Mordechay Goods=
tein 2018-10-21  2517  		txq_id =3D ret;
5ee7911e8e17af drivers/net/wireless/intel/iwlwifi/mvm/sta.c Mordechay Goods=
tein 2018-10-21  2518  =

cf961e16620f88 drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2015-08-13  2519  		/* TXQ hasn't yet been enabled, so mark it only as=
 reserved */
cf961e16620f88 drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2015-08-13  2520  		mvm->queue_info[txq_id].status =3D IWL_MVM_QUEUE_R=
ESERVED;
5ee7911e8e17af drivers/net/wireless/intel/iwlwifi/mvm/sta.c Mordechay Goods=
tein 2018-10-21  2521  	} else if (WARN_ON(txq_id >=3D IWL_MAX_HW_QUEUES)) {
5ee7911e8e17af drivers/net/wireless/intel/iwlwifi/mvm/sta.c Mordechay Goods=
tein 2018-10-21  2522  		ret =3D -ENXIO;
5ee7911e8e17af drivers/net/wireless/intel/iwlwifi/mvm/sta.c Mordechay Goods=
tein 2018-10-21  2523  		IWL_ERR(mvm, "tid_id %d out of range (0, %d)!\n",
5ee7911e8e17af drivers/net/wireless/intel/iwlwifi/mvm/sta.c Mordechay Goods=
tein 2018-10-21  2524  			tid, IWL_MAX_HW_QUEUES - 1);
5ee7911e8e17af drivers/net/wireless/intel/iwlwifi/mvm/sta.c Mordechay Goods=
tein 2018-10-21  2525  		goto out;
5ee7911e8e17af drivers/net/wireless/intel/iwlwifi/mvm/sta.c Mordechay Goods=
tein 2018-10-21  2526  =

4a6d2e525b43eb drivers/net/wireless/intel/iwlwifi/mvm/sta.c Avraham Stern  =
     2018-03-05  2527  	} else if (unlikely(mvm->queue_info[txq_id].status =
=3D=3D
4a6d2e525b43eb drivers/net/wireless/intel/iwlwifi/mvm/sta.c Avraham Stern  =
     2018-03-05  2528  			    IWL_MVM_QUEUE_SHARED)) {
4a6d2e525b43eb drivers/net/wireless/intel/iwlwifi/mvm/sta.c Avraham Stern  =
     2018-03-05  2529  		ret =3D -ENXIO;
4a6d2e525b43eb drivers/net/wireless/intel/iwlwifi/mvm/sta.c Avraham Stern  =
     2018-03-05  2530  		IWL_DEBUG_TX_QUEUES(mvm,
4a6d2e525b43eb drivers/net/wireless/intel/iwlwifi/mvm/sta.c Avraham Stern  =
     2018-03-05  2531  				    "Can't start tid %d agg on shared queue!\n",
4a6d2e525b43eb drivers/net/wireless/intel/iwlwifi/mvm/sta.c Avraham Stern  =
     2018-03-05  2532  				    tid);
4a6d2e525b43eb drivers/net/wireless/intel/iwlwifi/mvm/sta.c Avraham Stern  =
     2018-03-05  2533  		goto release_locks;
cf961e16620f88 drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2015-08-13  2534  	}
9f9af3d7d303a5 drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2015-12-23  2535  =

9f9af3d7d303a5 drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2015-12-23  2536  	spin_unlock(&mvm->queue_info_lock);
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-01-24  2537  =

cf961e16620f88 drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2015-08-13  2538  	IWL_DEBUG_TX_QUEUES(mvm,
cf961e16620f88 drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2015-08-13  2539  			    "AGG for tid %d will be on queue #%d\n",
cf961e16620f88 drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2015-08-13  2540  			    tid, txq_id);
cf961e16620f88 drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2015-08-13  2541  =

8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-01-24  2542  	tid_data =3D &mvmsta->tid_data[tid];
9a886586c82aa0 drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-02-15  2543  	tid_data->ssn =3D IEEE80211_SEQ_TO_SN(tid_data->seq=
_number);
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-01-24  2544  	tid_data->txq_id =3D txq_id;
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-01-24  2545  	*ssn =3D tid_data->ssn;
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-01-24  2546  =

8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-01-24  2547  	IWL_DEBUG_TX_QUEUES(mvm,
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-01-24  2548  			    "Start AGG: sta %d tid %d queue %d - ssn =3D =
%d, next_recl =3D %d\n",
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-01-24  2549  			    mvmsta->sta_id, tid, txq_id, tid_data->ssn,
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-01-24  2550  			    tid_data->next_reclaimed);
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-01-24  2551  =

dd32162da4e5b3 drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2017-04-05  2552  	/*
2f7a3863191afc drivers/net/wireless/intel/iwlwifi/mvm/sta.c Luca Coelho    =
     2017-11-15  2553  	 * In 22000 HW, the next_reclaimed index is only 8 =
bit, so we'll need
dd32162da4e5b3 drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2017-04-05  2554  	 * to align the wrap around of ssn so we compare re=
levant values.
dd32162da4e5b3 drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2017-04-05  2555  	 */
dd32162da4e5b3 drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2017-04-05  2556  	normalized_ssn =3D tid_data->ssn;
dd32162da4e5b3 drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2017-04-05  2557  	if (mvm->trans->cfg->gen2)
dd32162da4e5b3 drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2017-04-05  2558  		normalized_ssn &=3D 0xff;
dd32162da4e5b3 drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2017-04-05  2559  =

dd32162da4e5b3 drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2017-04-05  2560  	if (normalized_ssn =3D=3D tid_data->next_reclaimed)=
 {
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-01-24  2561  		tid_data->state =3D IWL_AGG_STARTING;
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-01-24  2562  		ieee80211_start_tx_ba_cb_irqsafe(vif, sta->addr, t=
id);
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-01-24  2563  	} else {
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-01-24  2564  		tid_data->state =3D IWL_EMPTYING_HW_QUEUE_ADDBA;
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-01-24  2565  	}
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-01-24  2566  =

4ecafae9e56802 drivers/net/wireless/iwlwifi/mvm/sta.c       Liad Kaufman   =
     2015-07-14  2567  	ret =3D 0;
9f9af3d7d303a5 drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2015-12-23  2568  	goto out;
4ecafae9e56802 drivers/net/wireless/iwlwifi/mvm/sta.c       Liad Kaufman   =
     2015-07-14  2569  =

4ecafae9e56802 drivers/net/wireless/iwlwifi/mvm/sta.c       Liad Kaufman   =
     2015-07-14  2570  release_locks:
9f9af3d7d303a5 drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2015-12-23  2571  	spin_unlock(&mvm->queue_info_lock);
9f9af3d7d303a5 drivers/net/wireless/intel/iwlwifi/mvm/sta.c Liad Kaufman   =
     2015-12-23  2572  out:
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-01-24 @2573  	spin_unlock_bh(&mvmsta->lock);
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-01-24  2574  =

4ecafae9e56802 drivers/net/wireless/iwlwifi/mvm/sta.c       Liad Kaufman   =
     2015-07-14  2575  	return ret;
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-01-24  2576  }
8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/sta.c       Johannes Berg  =
     2013-01-24  2577  =


:::::: The code at line 2573 was first introduced by commit
:::::: 8ca151b568b67a7b72dcfc6ee6ea7c107ddd795c iwlwifi: add the MVM driver

:::::: TO: Johannes Berg <johannes.berg@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============9003148286178326381==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
aose3DKuc50oliAIOmP+Pz9GzImHtwEA
--===============9003148286178326381==--

