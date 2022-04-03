Content-Type: multipart/mixed; boundary="===============0055810310500105258=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/intel/i40e/i40e_main.c:2406:3: warning: There is an unknown macro here somewhere. Configuration is required. If hlist_for_each_entry is a macro then please configure it. [unknownMacro]
Date: Sun, 03 Apr 2022 12:38:25 +0800
Message-ID: <202204031231.VzDIrS8D-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0055810310500105258==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Di Zhu <zhudi2@huawei.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Rui Zhang <zhangrui182@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   be2d3ecedd9911fbfd7e55cc9ceac5f8b79ae4cf
commit: 3116f59c12bd24c513194cd3acb3ec1f7d468954 i40e: fix use-after-free i=
n i40e_sync_filters_subtask()
date:   3 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 3 months ago
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/ieee802154/core.c:75:13: warning: Uninitialized variable: rdev->wpan=
_phy_idx [uninitvar]
     if (rdev->wpan_phy_idx =3D=3D wpan_phy_idx) {
               ^
>> net/ieee802154/core.c:327:35: warning: Uninitialized variables: rdev.ops=
, rdev.list, rdev.wpan_phy_idx, rdev.opencount, rdev.dev_wait, rdev.num_run=
ning_ifaces, rdev.wpan_dev_list, rdev.devlist_generation, rdev.wpan_dev_id =
[uninitvar]
      WARN_ON(cfg802154_switch_netns(rdev, &init_net));
                                     ^
--
>> net/core/devlink.c:3950:2: warning: There is an unknown macro here somew=
here. Configuration is required. If list_for_each_entry is a macro then ple=
ase configure it. [unknownMacro]
    list_for_each_entry(param_item, &devlink->param_list, list)
    ^
--
>> drivers/net/ethernet/intel/i40e/i40e_main.c:2406:3: warning: There is an=
 unknown macro here somewhere. Configuration is required. If hlist_for_each=
_entry is a macro then please configure it. [unknownMacro]
     hlist_for_each_entry(new, &tmp_add_list, hlist)
     ^

vim +2406 drivers/net/ethernet/intel/i40e/i40e_main.c

bd5608b3223bc7 Alan Brady           2017-11-14  2311  =

41c445ff0f482b Jesse Brandeburg     2013-09-11  2312  /**
41c445ff0f482b Jesse Brandeburg     2013-09-11  2313   * i40e_sync_vsi_filt=
ers - Update the VSI filter list to the HW
41c445ff0f482b Jesse Brandeburg     2013-09-11  2314   * @vsi: ptr to the V=
SI
41c445ff0f482b Jesse Brandeburg     2013-09-11  2315   *
41c445ff0f482b Jesse Brandeburg     2013-09-11  2316   * Push any outstandi=
ng VSI filter changes through the AdminQ.
41c445ff0f482b Jesse Brandeburg     2013-09-11  2317   *
41c445ff0f482b Jesse Brandeburg     2013-09-11  2318   * Returns 0 or error=
 value
41c445ff0f482b Jesse Brandeburg     2013-09-11  2319   **/
17652c6336fdca Jesse Brandeburg     2015-11-05  2320  int i40e_sync_vsi_fil=
ters(struct i40e_vsi *vsi)
41c445ff0f482b Jesse Brandeburg     2013-09-11  2321  {
278e7d0b9d6864 Jacob Keller         2016-10-05  2322  	struct hlist_head tm=
p_add_list, tmp_del_list;
671889e6740ac7 Jacob Keller         2016-12-02  2323  	struct i40e_mac_filt=
er *f;
671889e6740ac7 Jacob Keller         2016-12-02  2324  	struct i40e_new_mac_=
filter *new, *add_head =3D NULL;
3e25a8f31af1c7 Mitch Williams       2016-05-16  2325  	struct i40e_hw *hw =
=3D &vsi->back->hw;
cc6a96a41991de Alan Brady           2018-01-22  2326  	bool old_overflow, n=
ew_overflow;
38326218acce33 Jacob Keller         2016-11-11  2327  	unsigned int failed_=
filters =3D 0;
84f5ca6cf4ea1d Alan Brady           2016-10-05  2328  	unsigned int vlan_fi=
lters =3D 0;
2d1de8283f3714 Shannon Nelson       2016-05-16  2329  	char vsi_name[16] =
=3D "PF";
41c445ff0f482b Jesse Brandeburg     2013-09-11  2330  	int filter_list_len =
=3D 0;
ea02e90b4b4978 Mitch Williams       2015-11-09  2331  	i40e_status aq_ret =
=3D 0;
84f5ca6cf4ea1d Alan Brady           2016-10-05  2332  	u32 changed_flags =
=3D 0;
278e7d0b9d6864 Jacob Keller         2016-10-05  2333  	struct hlist_node *h;
41c445ff0f482b Jesse Brandeburg     2013-09-11  2334  	struct i40e_pf *pf;
41c445ff0f482b Jesse Brandeburg     2013-09-11  2335  	int num_add =3D 0;
41c445ff0f482b Jesse Brandeburg     2013-09-11  2336  	int num_del =3D 0;
84f5ca6cf4ea1d Alan Brady           2016-10-05  2337  	int retval =3D 0;
41c445ff0f482b Jesse Brandeburg     2013-09-11  2338  	u16 cmd_flags;
c3c7ea27bec070 Mitch Williams       2016-06-20  2339  	int list_size;
278e7d0b9d6864 Jacob Keller         2016-10-05  2340  	int bkt;
41c445ff0f482b Jesse Brandeburg     2013-09-11  2341  =

41c445ff0f482b Jesse Brandeburg     2013-09-11  2342  	/* empty array typed=
 pointers, kcalloc later */
41c445ff0f482b Jesse Brandeburg     2013-09-11  2343  	struct i40e_aqc_add_=
macvlan_element_data *add_list;
41c445ff0f482b Jesse Brandeburg     2013-09-11  2344  	struct i40e_aqc_remo=
ve_macvlan_element_data *del_list;
41c445ff0f482b Jesse Brandeburg     2013-09-11  2345  =

0da36b9774cc24 Jacob Keller         2017-04-19  2346  	while (test_and_set_=
bit(__I40E_VSI_SYNCING_FILTERS, vsi->state))
41c445ff0f482b Jesse Brandeburg     2013-09-11  2347  		usleep_range(1000, =
2000);
41c445ff0f482b Jesse Brandeburg     2013-09-11  2348  	pf =3D vsi->back;
41c445ff0f482b Jesse Brandeburg     2013-09-11  2349  =

cc6a96a41991de Alan Brady           2018-01-22  2350  	old_overflow =3D tes=
t_bit(__I40E_VSI_OVERFLOW_PROMISC, vsi->state);
cc6a96a41991de Alan Brady           2018-01-22  2351  =

41c445ff0f482b Jesse Brandeburg     2013-09-11  2352  	if (vsi->netdev) {
41c445ff0f482b Jesse Brandeburg     2013-09-11  2353  		changed_flags =3D v=
si->current_netdev_flags ^ vsi->netdev->flags;
41c445ff0f482b Jesse Brandeburg     2013-09-11  2354  		vsi->current_netdev=
_flags =3D vsi->netdev->flags;
41c445ff0f482b Jesse Brandeburg     2013-09-11  2355  	}
41c445ff0f482b Jesse Brandeburg     2013-09-11  2356  =

278e7d0b9d6864 Jacob Keller         2016-10-05  2357  	INIT_HLIST_HEAD(&tmp=
_add_list);
278e7d0b9d6864 Jacob Keller         2016-10-05  2358  	INIT_HLIST_HEAD(&tmp=
_del_list);
216590355cb0e7 Kiran Patil          2015-09-30  2359  =

2d1de8283f3714 Shannon Nelson       2016-05-16  2360  	if (vsi->type =3D=3D=
 I40E_VSI_SRIOV)
2d1de8283f3714 Shannon Nelson       2016-05-16  2361  		snprintf(vsi_name, =
sizeof(vsi_name) - 1, "VF %d", vsi->vf_id);
2d1de8283f3714 Shannon Nelson       2016-05-16  2362  	else if (vsi->type !=
=3D I40E_VSI_MAIN)
2d1de8283f3714 Shannon Nelson       2016-05-16  2363  		snprintf(vsi_name, =
sizeof(vsi_name) - 1, "vsi %d", vsi->seid);
2d1de8283f3714 Shannon Nelson       2016-05-16  2364  =

41c445ff0f482b Jesse Brandeburg     2013-09-11  2365  	if (vsi->flags & I40=
E_VSI_FLAG_FILTER_CHANGED) {
41c445ff0f482b Jesse Brandeburg     2013-09-11  2366  		vsi->flags &=3D ~I4=
0E_VSI_FLAG_FILTER_CHANGED;
41c445ff0f482b Jesse Brandeburg     2013-09-11  2367  =

278e7d0b9d6864 Jacob Keller         2016-10-05  2368  		spin_lock_bh(&vsi->=
mac_filter_hash_lock);
c3c7ea27bec070 Mitch Williams       2016-06-20  2369  		/* Create a list of=
 filters to delete. */
278e7d0b9d6864 Jacob Keller         2016-10-05  2370  		hash_for_each_safe(=
vsi->mac_filter_hash, bkt, h, f, hlist) {
c3c7ea27bec070 Mitch Williams       2016-06-20  2371  			if (f->state =3D=
=3D I40E_FILTER_REMOVE) {
216590355cb0e7 Kiran Patil          2015-09-30  2372  				/* Move the eleme=
nt into temporary del_list */
278e7d0b9d6864 Jacob Keller         2016-10-05  2373  				hash_del(&f->hlis=
t);
278e7d0b9d6864 Jacob Keller         2016-10-05  2374  				hlist_add_head(&f=
->hlist, &tmp_del_list);
84f5ca6cf4ea1d Alan Brady           2016-10-05  2375  =

84f5ca6cf4ea1d Alan Brady           2016-10-05  2376  				/* Avoid counting=
 removed filters */
84f5ca6cf4ea1d Alan Brady           2016-10-05  2377  				continue;
216590355cb0e7 Kiran Patil          2015-09-30  2378  			}
c3c7ea27bec070 Mitch Williams       2016-06-20  2379  			if (f->state =3D=
=3D I40E_FILTER_NEW) {
671889e6740ac7 Jacob Keller         2016-12-02  2380  				/* Create a tempo=
rary i40e_new_mac_filter */
671889e6740ac7 Jacob Keller         2016-12-02  2381  				new =3D kzalloc(s=
izeof(*new), GFP_ATOMIC);
671889e6740ac7 Jacob Keller         2016-12-02  2382  				if (!new)
671889e6740ac7 Jacob Keller         2016-12-02  2383  					goto err_no_memo=
ry_locked;
671889e6740ac7 Jacob Keller         2016-12-02  2384  =

671889e6740ac7 Jacob Keller         2016-12-02  2385  				/* Store pointer =
to the real filter */
671889e6740ac7 Jacob Keller         2016-12-02  2386  				new->f =3D f;
671889e6740ac7 Jacob Keller         2016-12-02  2387  				new->state =3D f-=
>state;
671889e6740ac7 Jacob Keller         2016-12-02  2388  =

671889e6740ac7 Jacob Keller         2016-12-02  2389  				/* Add it to the =
hash list */
671889e6740ac7 Jacob Keller         2016-12-02  2390  				hlist_add_head(&n=
ew->hlist, &tmp_add_list);
216590355cb0e7 Kiran Patil          2015-09-30  2391  			}
84f5ca6cf4ea1d Alan Brady           2016-10-05  2392  =

489a32650721b0 Jacob Keller         2016-11-11  2393  			/* Count the numbe=
r of active (current and new) VLAN
489a32650721b0 Jacob Keller         2016-11-11  2394  			 * filters we have=
 now. Does not count filters which
489a32650721b0 Jacob Keller         2016-11-11  2395  			 * are marked for =
deletion.
84f5ca6cf4ea1d Alan Brady           2016-10-05  2396  			 */
84f5ca6cf4ea1d Alan Brady           2016-10-05  2397  			if (f->vlan > 0)
84f5ca6cf4ea1d Alan Brady           2016-10-05  2398  				vlan_filters++;
84f5ca6cf4ea1d Alan Brady           2016-10-05  2399  		}
84f5ca6cf4ea1d Alan Brady           2016-10-05  2400  =

489a32650721b0 Jacob Keller         2016-11-11  2401  		retval =3D i40e_cor=
rect_mac_vlan_filters(vsi,
489a32650721b0 Jacob Keller         2016-11-11  2402  						       &tmp_add=
_list,
489a32650721b0 Jacob Keller         2016-11-11  2403  						       &tmp_del=
_list,
489a32650721b0 Jacob Keller         2016-11-11  2404  						       vlan_fil=
ters);
3116f59c12bd24 Di Zhu               2021-11-29  2405  =

3116f59c12bd24 Di Zhu               2021-11-29 @2406  		hlist_for_each_entr=
y(new, &tmp_add_list, hlist)
3116f59c12bd24 Di Zhu               2021-11-29  2407  			netdev_hw_addr_ref=
cnt(new->f, vsi->netdev, 1);
3116f59c12bd24 Di Zhu               2021-11-29  2408  =

489a32650721b0 Jacob Keller         2016-11-11  2409  		if (retval)
84f5ca6cf4ea1d Alan Brady           2016-10-05  2410  			goto err_no_memory=
_locked;
84f5ca6cf4ea1d Alan Brady           2016-10-05  2411  =

278e7d0b9d6864 Jacob Keller         2016-10-05  2412  		spin_unlock_bh(&vsi=
->mac_filter_hash_lock);
216590355cb0e7 Kiran Patil          2015-09-30  2413  	}
216590355cb0e7 Kiran Patil          2015-09-30  2414  =

216590355cb0e7 Kiran Patil          2015-09-30  2415  	/* Now process 'del_=
list' outside the lock */
278e7d0b9d6864 Jacob Keller         2016-10-05  2416  	if (!hlist_empty(&tm=
p_del_list)) {
3e25a8f31af1c7 Mitch Williams       2016-05-16  2417  		filter_list_len =3D=
 hw->aq.asq_buf_size /
216590355cb0e7 Kiran Patil          2015-09-30  2418  			    sizeof(struct =
i40e_aqc_remove_macvlan_element_data);
c3c7ea27bec070 Mitch Williams       2016-06-20  2419  		list_size =3D filte=
r_list_len *
f11999987bc0b5 Shannon Nelson       2015-11-19  2420  			    sizeof(struct =
i40e_aqc_remove_macvlan_element_data);
c3c7ea27bec070 Mitch Williams       2016-06-20  2421  		del_list =3D kzallo=
c(list_size, GFP_ATOMIC);
4a2ce27bb5f291 Jacob Keller         2016-10-05  2422  		if (!del_list)
4a2ce27bb5f291 Jacob Keller         2016-10-05  2423  			goto err_no_memory;
216590355cb0e7 Kiran Patil          2015-09-30  2424  =

278e7d0b9d6864 Jacob Keller         2016-10-05  2425  		hlist_for_each_entr=
y_safe(f, h, &tmp_del_list, hlist) {
41c445ff0f482b Jesse Brandeburg     2013-09-11  2426  			cmd_flags =3D 0;
41c445ff0f482b Jesse Brandeburg     2013-09-11  2427  =

435c084aad9615 Jacob Keller         2016-11-08  2428  			/* handle broadcas=
t filters by updating the broadcast
d88d40b01c5c0d Jacob Keller         2016-12-02  2429  			 * promiscuous fla=
g and release filter list.
435c084aad9615 Jacob Keller         2016-11-08  2430  			 */
435c084aad9615 Jacob Keller         2016-11-08  2431  			if (is_broadcast_e=
ther_addr(f->macaddr)) {
435c084aad9615 Jacob Keller         2016-11-08  2432  				i40e_aqc_broadcas=
t_filter(vsi, vsi_name, f);
435c084aad9615 Jacob Keller         2016-11-08  2433  =

435c084aad9615 Jacob Keller         2016-11-08  2434  				hlist_del(&f->hli=
st);
435c084aad9615 Jacob Keller         2016-11-08  2435  				kfree(f);
435c084aad9615 Jacob Keller         2016-11-08  2436  				continue;
435c084aad9615 Jacob Keller         2016-11-08  2437  			}
435c084aad9615 Jacob Keller         2016-11-08  2438  =

41c445ff0f482b Jesse Brandeburg     2013-09-11  2439  			/* add to delete l=
ist */
9a173901d9969d Greg Rose            2014-05-22  2440  			ether_addr_copy(de=
l_list[num_del].mac_addr, f->macaddr);
c3c7ea27bec070 Mitch Williams       2016-06-20  2441  			if (f->vlan =3D=3D=
 I40E_VLAN_ANY) {
c3c7ea27bec070 Mitch Williams       2016-06-20  2442  				del_list[num_del]=
.vlan_tag =3D 0;
a6cb91464b5b09 Alan Brady           2016-09-06  2443  				cmd_flags |=3D I4=
0E_AQC_MACVLAN_DEL_IGNORE_VLAN;
c3c7ea27bec070 Mitch Williams       2016-06-20  2444  			} else {
41c445ff0f482b Jesse Brandeburg     2013-09-11  2445  				del_list[num_del]=
.vlan_tag =3D
c3c7ea27bec070 Mitch Williams       2016-06-20  2446  					cpu_to_le16((u16=
)(f->vlan));
c3c7ea27bec070 Mitch Williams       2016-06-20  2447  			}
41c445ff0f482b Jesse Brandeburg     2013-09-11  2448  =

41c445ff0f482b Jesse Brandeburg     2013-09-11  2449  			cmd_flags |=3D I40=
E_AQC_MACVLAN_DEL_PERFECT_MATCH;
41c445ff0f482b Jesse Brandeburg     2013-09-11  2450  			del_list[num_del].=
flags =3D cmd_flags;
41c445ff0f482b Jesse Brandeburg     2013-09-11  2451  			num_del++;
41c445ff0f482b Jesse Brandeburg     2013-09-11  2452  =

41c445ff0f482b Jesse Brandeburg     2013-09-11  2453  			/* flush a full bu=
ffer */
41c445ff0f482b Jesse Brandeburg     2013-09-11  2454  			if (num_del =3D=3D=
 filter_list_len) {
0093631966aad0 Jacob Keller         2016-10-05  2455  				i40e_aqc_del_filt=
ers(vsi, vsi_name, del_list,
0093631966aad0 Jacob Keller         2016-10-05  2456  						     num_del, &=
retval);
c3c7ea27bec070 Mitch Williams       2016-06-20  2457  				memset(del_list, =
0, list_size);
0093631966aad0 Jacob Keller         2016-10-05  2458  				num_del =3D 0;
ea02e90b4b4978 Mitch Williams       2015-11-09  2459  			}
216590355cb0e7 Kiran Patil          2015-09-30  2460  			/* Release memory =
for MAC filter entries which were
216590355cb0e7 Kiran Patil          2015-09-30  2461  			 * synced up with =
HW.
216590355cb0e7 Kiran Patil          2015-09-30  2462  			 */
278e7d0b9d6864 Jacob Keller         2016-10-05  2463  			hlist_del(&f->hlis=
t);
216590355cb0e7 Kiran Patil          2015-09-30  2464  			kfree(f);
41c445ff0f482b Jesse Brandeburg     2013-09-11  2465  		}
216590355cb0e7 Kiran Patil          2015-09-30  2466  =

41c445ff0f482b Jesse Brandeburg     2013-09-11  2467  		if (num_del) {
0093631966aad0 Jacob Keller         2016-10-05  2468  			i40e_aqc_del_filte=
rs(vsi, vsi_name, del_list,
0093631966aad0 Jacob Keller         2016-10-05  2469  					     num_del, &r=
etval);
c3c7ea27bec070 Mitch Williams       2016-06-20  2470  		}
41c445ff0f482b Jesse Brandeburg     2013-09-11  2471  =

41c445ff0f482b Jesse Brandeburg     2013-09-11  2472  		kfree(del_list);
41c445ff0f482b Jesse Brandeburg     2013-09-11  2473  		del_list =3D NULL;
216590355cb0e7 Kiran Patil          2015-09-30  2474  	}
216590355cb0e7 Kiran Patil          2015-09-30  2475  =

278e7d0b9d6864 Jacob Keller         2016-10-05  2476  	if (!hlist_empty(&tm=
p_add_list)) {
c3c7ea27bec070 Mitch Williams       2016-06-20  2477  		/* Do all the adds =
now. */
3e25a8f31af1c7 Mitch Williams       2016-05-16  2478  		filter_list_len =3D=
 hw->aq.asq_buf_size /
f11999987bc0b5 Shannon Nelson       2015-11-19  2479  			       sizeof(stru=
ct i40e_aqc_add_macvlan_element_data);
c3c7ea27bec070 Mitch Williams       2016-06-20  2480  		list_size =3D filte=
r_list_len *
c3c7ea27bec070 Mitch Williams       2016-06-20  2481  			       sizeof(stru=
ct i40e_aqc_add_macvlan_element_data);
c3c7ea27bec070 Mitch Williams       2016-06-20  2482  		add_list =3D kzallo=
c(list_size, GFP_ATOMIC);
4a2ce27bb5f291 Jacob Keller         2016-10-05  2483  		if (!add_list)
4a2ce27bb5f291 Jacob Keller         2016-10-05  2484  			goto err_no_memory;
4a2ce27bb5f291 Jacob Keller         2016-10-05  2485  =

c3c7ea27bec070 Mitch Williams       2016-06-20  2486  		num_add =3D 0;
671889e6740ac7 Jacob Keller         2016-12-02  2487  		hlist_for_each_entr=
y_safe(new, h, &tmp_add_list, hlist) {
435c084aad9615 Jacob Keller         2016-11-08  2488  			/* handle broadcas=
t filters by updating the broadcast
435c084aad9615 Jacob Keller         2016-11-08  2489  			 * promiscuous fla=
g instead of adding a MAC filter.
435c084aad9615 Jacob Keller         2016-11-08  2490  			 */
671889e6740ac7 Jacob Keller         2016-12-02  2491  			if (is_broadcast_e=
ther_addr(new->f->macaddr)) {
671889e6740ac7 Jacob Keller         2016-12-02  2492  				if (i40e_aqc_broa=
dcast_filter(vsi, vsi_name,
671889e6740ac7 Jacob Keller         2016-12-02  2493  							      new->f))
671889e6740ac7 Jacob Keller         2016-12-02  2494  					new->state =3D I=
40E_FILTER_FAILED;
671889e6740ac7 Jacob Keller         2016-12-02  2495  				else
671889e6740ac7 Jacob Keller         2016-12-02  2496  					new->state =3D I=
40E_FILTER_ACTIVE;
435c084aad9615 Jacob Keller         2016-11-08  2497  				continue;
435c084aad9615 Jacob Keller         2016-11-08  2498  			}
435c084aad9615 Jacob Keller         2016-11-08  2499  =

41c445ff0f482b Jesse Brandeburg     2013-09-11  2500  			/* add to add arra=
y */
c3c7ea27bec070 Mitch Williams       2016-06-20  2501  			if (num_add =3D=3D=
 0)
671889e6740ac7 Jacob Keller         2016-12-02  2502  				add_head =3D new;
c3c7ea27bec070 Mitch Williams       2016-06-20  2503  			cmd_flags =3D 0;
671889e6740ac7 Jacob Keller         2016-12-02  2504  			ether_addr_copy(ad=
d_list[num_add].mac_addr,
671889e6740ac7 Jacob Keller         2016-12-02  2505  					new->f->macaddr);
671889e6740ac7 Jacob Keller         2016-12-02  2506  			if (new->f->vlan =
=3D=3D I40E_VLAN_ANY) {
c3c7ea27bec070 Mitch Williams       2016-06-20  2507  				add_list[num_add]=
.vlan_tag =3D 0;
c3c7ea27bec070 Mitch Williams       2016-06-20  2508  				cmd_flags |=3D I4=
0E_AQC_MACVLAN_ADD_IGNORE_VLAN;
c3c7ea27bec070 Mitch Williams       2016-06-20  2509  			} else {
41c445ff0f482b Jesse Brandeburg     2013-09-11  2510  				add_list[num_add]=
.vlan_tag =3D
671889e6740ac7 Jacob Keller         2016-12-02  2511  					cpu_to_le16((u16=
)(new->f->vlan));
c3c7ea27bec070 Mitch Williams       2016-06-20  2512  			}
41c445ff0f482b Jesse Brandeburg     2013-09-11  2513  			add_list[num_add].=
queue_number =3D 0;
ac9e239014413e Jacob Keller         2016-11-11  2514  			/* set invalid mat=
ch method for later detection */
0266ac4536cdbf Keller, Jacob E      2016-12-09  2515  			add_list[num_add].=
match_method =3D I40E_AQC_MM_ERR_NO_RES;
41c445ff0f482b Jesse Brandeburg     2013-09-11  2516  			cmd_flags |=3D I40=
E_AQC_MACVLAN_ADD_PERFECT_MATCH;
41c445ff0f482b Jesse Brandeburg     2013-09-11  2517  			add_list[num_add].=
flags =3D cpu_to_le16(cmd_flags);
41c445ff0f482b Jesse Brandeburg     2013-09-11  2518  			num_add++;
41c445ff0f482b Jesse Brandeburg     2013-09-11  2519  =

41c445ff0f482b Jesse Brandeburg     2013-09-11  2520  			/* flush a full bu=
ffer */
41c445ff0f482b Jesse Brandeburg     2013-09-11  2521  			if (num_add =3D=3D=
 filter_list_len) {
0093631966aad0 Jacob Keller         2016-10-05  2522  				i40e_aqc_add_filt=
ers(vsi, vsi_name, add_list,
cc6a96a41991de Alan Brady           2018-01-22  2523  						     add_head, =
num_add);
c3c7ea27bec070 Mitch Williams       2016-06-20  2524  				memset(add_list, =
0, list_size);
41c445ff0f482b Jesse Brandeburg     2013-09-11  2525  				num_add =3D 0;
41c445ff0f482b Jesse Brandeburg     2013-09-11  2526  			}
41c445ff0f482b Jesse Brandeburg     2013-09-11  2527  		}
41c445ff0f482b Jesse Brandeburg     2013-09-11  2528  		if (num_add) {
0093631966aad0 Jacob Keller         2016-10-05  2529  			i40e_aqc_add_filte=
rs(vsi, vsi_name, add_list, add_head,
cc6a96a41991de Alan Brady           2018-01-22  2530  					     num_add);
c3c7ea27bec070 Mitch Williams       2016-06-20  2531  		}
c3c7ea27bec070 Mitch Williams       2016-06-20  2532  		/* Now move all of =
the filters from the temp add list back to
c3c7ea27bec070 Mitch Williams       2016-06-20  2533  		 * the VSI's list.
c3c7ea27bec070 Mitch Williams       2016-06-20  2534  		 */
278e7d0b9d6864 Jacob Keller         2016-10-05  2535  		spin_lock_bh(&vsi->=
mac_filter_hash_lock);
671889e6740ac7 Jacob Keller         2016-12-02  2536  		hlist_for_each_entr=
y_safe(new, h, &tmp_add_list, hlist) {
671889e6740ac7 Jacob Keller         2016-12-02  2537  			/* Only update the=
 state if we're still NEW */
671889e6740ac7 Jacob Keller         2016-12-02  2538  			if (new->f->state =
=3D=3D I40E_FILTER_NEW)
671889e6740ac7 Jacob Keller         2016-12-02  2539  				new->f->state =3D=
 new->state;
671889e6740ac7 Jacob Keller         2016-12-02  2540  			hlist_del(&new->hl=
ist);
3116f59c12bd24 Di Zhu               2021-11-29  2541  			netdev_hw_addr_ref=
cnt(new->f, vsi->netdev, -1);
671889e6740ac7 Jacob Keller         2016-12-02  2542  			kfree(new);
41c445ff0f482b Jesse Brandeburg     2013-09-11  2543  		}
278e7d0b9d6864 Jacob Keller         2016-10-05  2544  		spin_unlock_bh(&vsi=
->mac_filter_hash_lock);
41c445ff0f482b Jesse Brandeburg     2013-09-11  2545  		kfree(add_list);
41c445ff0f482b Jesse Brandeburg     2013-09-11  2546  		add_list =3D NULL;
c3c7ea27bec070 Mitch Williams       2016-06-20  2547  	}
41c445ff0f482b Jesse Brandeburg     2013-09-11  2548  =

38326218acce33 Jacob Keller         2016-11-11  2549  	/* Determine the num=
ber of active and failed filters. */
278e7d0b9d6864 Jacob Keller         2016-10-05  2550  	spin_lock_bh(&vsi->m=
ac_filter_hash_lock);
38326218acce33 Jacob Keller         2016-11-11  2551  	vsi->active_filters =
=3D 0;
278e7d0b9d6864 Jacob Keller         2016-10-05  2552  	hash_for_each(vsi->m=
ac_filter_hash, bkt, f, hlist) {
38326218acce33 Jacob Keller         2016-11-11  2553  		if (f->state =3D=3D=
 I40E_FILTER_ACTIVE)
38326218acce33 Jacob Keller         2016-11-11  2554  			vsi->active_filter=
s++;
38326218acce33 Jacob Keller         2016-11-11  2555  		else if (f->state =
=3D=3D I40E_FILTER_FAILED)
38326218acce33 Jacob Keller         2016-11-11  2556  			failed_filters++;
c3c7ea27bec070 Mitch Williams       2016-06-20  2557  	}
278e7d0b9d6864 Jacob Keller         2016-10-05  2558  	spin_unlock_bh(&vsi-=
>mac_filter_hash_lock);
38326218acce33 Jacob Keller         2016-11-11  2559  =

38326218acce33 Jacob Keller         2016-11-11  2560  	/* Check if we are a=
ble to exit overflow promiscuous mode. We can
38326218acce33 Jacob Keller         2016-11-11  2561  	 * safely exit if we=
 didn't just enter, we no longer have any failed
38326218acce33 Jacob Keller         2016-11-11  2562  	 * filters, and we h=
ave reduced filters below the threshold value.
38326218acce33 Jacob Keller         2016-11-11  2563  	 */
cc6a96a41991de Alan Brady           2018-01-22  2564  	if (old_overflow && =
!failed_filters &&
cc6a96a41991de Alan Brady           2018-01-22  2565  	    vsi->active_filt=
ers < vsi->promisc_threshold) {
41c445ff0f482b Jesse Brandeburg     2013-09-11  2566  		dev_info(&pf->pdev-=
>dev,
c3c7ea27bec070 Mitch Williams       2016-06-20  2567  			 "filter logjam cl=
eared on %s, leaving overflow promiscuous mode\n",
2d1de8283f3714 Shannon Nelson       2016-05-16  2568  			 vsi_name);
0da36b9774cc24 Jacob Keller         2017-04-19  2569  		clear_bit(__I40E_VS=
I_OVERFLOW_PROMISC, vsi->state);
c3c7ea27bec070 Mitch Williams       2016-06-20  2570  		vsi->promisc_thresh=
old =3D 0;
41c445ff0f482b Jesse Brandeburg     2013-09-11  2571  	}
41c445ff0f482b Jesse Brandeburg     2013-09-11  2572  =

a856b5cb83fea4 Anjali Singhai Jain  2016-04-13  2573  	/* if the VF is not =
trusted do not do promisc */
a856b5cb83fea4 Anjali Singhai Jain  2016-04-13  2574  	if ((vsi->type =3D=
=3D I40E_VSI_SRIOV) && !pf->vf[vsi->vf_id].trusted) {
0da36b9774cc24 Jacob Keller         2017-04-19  2575  		clear_bit(__I40E_VS=
I_OVERFLOW_PROMISC, vsi->state);
a856b5cb83fea4 Anjali Singhai Jain  2016-04-13  2576  		goto out;
a856b5cb83fea4 Anjali Singhai Jain  2016-04-13  2577  	}
a856b5cb83fea4 Anjali Singhai Jain  2016-04-13  2578  =

cc6a96a41991de Alan Brady           2018-01-22  2579  	new_overflow =3D tes=
t_bit(__I40E_VSI_OVERFLOW_PROMISC, vsi->state);
cc6a96a41991de Alan Brady           2018-01-22  2580  =

cc6a96a41991de Alan Brady           2018-01-22  2581  	/* If we are enterin=
g overflow promiscuous, we need to calculate a new
cc6a96a41991de Alan Brady           2018-01-22  2582  	 * threshold for whe=
n we are safe to exit
cc6a96a41991de Alan Brady           2018-01-22  2583  	 */
cc6a96a41991de Alan Brady           2018-01-22  2584  	if (!old_overflow &&=
 new_overflow)
cc6a96a41991de Alan Brady           2018-01-22  2585  		vsi->promisc_thresh=
old =3D (vsi->active_filters * 3) / 4;
cc6a96a41991de Alan Brady           2018-01-22  2586  =

41c445ff0f482b Jesse Brandeburg     2013-09-11  2587  	/* check for changes=
 in promiscuous modes */
41c445ff0f482b Jesse Brandeburg     2013-09-11  2588  	if (changed_flags & =
IFF_ALLMULTI) {
41c445ff0f482b Jesse Brandeburg     2013-09-11  2589  		bool cur_multipromi=
sc;
6995b36c0fc3dd Jesse Brandeburg     2015-08-28  2590  =

41c445ff0f482b Jesse Brandeburg     2013-09-11  2591  		cur_multipromisc =
=3D !!(vsi->current_netdev_flags & IFF_ALLMULTI);
ea02e90b4b4978 Mitch Williams       2015-11-09  2592  		aq_ret =3D i40e_aq_=
set_vsi_multicast_promiscuous(&vsi->back->hw,
41c445ff0f482b Jesse Brandeburg     2013-09-11  2593  							       vsi->se=
id,
41c445ff0f482b Jesse Brandeburg     2013-09-11  2594  							       cur_mul=
tipromisc,
41c445ff0f482b Jesse Brandeburg     2013-09-11  2595  							       NULL);
ea02e90b4b4978 Mitch Williams       2015-11-09  2596  		if (aq_ret) {
ea02e90b4b4978 Mitch Williams       2015-11-09  2597  			retval =3D i40e_aq=
_rc_to_posix(aq_ret,
3e25a8f31af1c7 Mitch Williams       2016-05-16  2598  						     hw->aq.asq=
_last_status);
41c445ff0f482b Jesse Brandeburg     2013-09-11  2599  			dev_info(&pf->pdev=
->dev,
2d1de8283f3714 Shannon Nelson       2016-05-16  2600  				 "set multi promi=
sc failed on %s, err %s aq_err %s\n",
2d1de8283f3714 Shannon Nelson       2016-05-16  2601  				 vsi_name,
3e25a8f31af1c7 Mitch Williams       2016-05-16  2602  				 i40e_stat_str(hw=
, aq_ret),
3e25a8f31af1c7 Mitch Williams       2016-05-16  2603  				 i40e_aq_str(hw, =
hw->aq.asq_last_status));
b603f9dc20afed Czeslaw Zagorski     2019-07-02  2604  		} else {
6b5674fe6b9bf0 Arkadiusz Kubalewski 2021-03-26  2605  			dev_info(&pf->pdev=
->dev, "%s allmulti mode.\n",
b603f9dc20afed Czeslaw Zagorski     2019-07-02  2606  				 cur_multipromisc=
 ? "entering" : "leaving");
41c445ff0f482b Jesse Brandeburg     2013-09-11  2607  		}
ea02e90b4b4978 Mitch Williams       2015-11-09  2608  	}
e5887239868454 Alan Brady           2017-06-07  2609  =

cc6a96a41991de Alan Brady           2018-01-22  2610  	if ((changed_flags &=
 IFF_PROMISC) || old_overflow !=3D new_overflow) {
41c445ff0f482b Jesse Brandeburg     2013-09-11  2611  		bool cur_promisc;
6995b36c0fc3dd Jesse Brandeburg     2015-08-28  2612  =

41c445ff0f482b Jesse Brandeburg     2013-09-11  2613  		cur_promisc =3D (!!=
(vsi->current_netdev_flags & IFF_PROMISC) ||
cc6a96a41991de Alan Brady           2018-01-22  2614  			       new_overflo=
w);
bd5608b3223bc7 Alan Brady           2017-11-14  2615  		aq_ret =3D i40e_set=
_promiscuous(pf, cur_promisc);
5bc160319f8a1e Mitch Williams       2016-05-16  2616  		if (aq_ret) {
5bc160319f8a1e Mitch Williams       2016-05-16  2617  			retval =3D i40e_aq=
_rc_to_posix(aq_ret,
5bc160319f8a1e Mitch Williams       2016-05-16  2618  						     hw->aq.asq=
_last_status);
5bc160319f8a1e Mitch Williams       2016-05-16  2619  			dev_info(&pf->pdev=
->dev,
bd5608b3223bc7 Alan Brady           2017-11-14  2620  				 "Setting promisc=
uous %s failed on %s, err %s aq_err %s\n",
bd5608b3223bc7 Alan Brady           2017-11-14  2621  				 cur_promisc ? "o=
n" : "off",
2d1de8283f3714 Shannon Nelson       2016-05-16  2622  				 vsi_name,
3e25a8f31af1c7 Mitch Williams       2016-05-16  2623  				 i40e_stat_str(hw=
, aq_ret),
bd5608b3223bc7 Alan Brady           2017-11-14  2624  				 i40e_aq_str(hw, =
hw->aq.asq_last_status));
41c445ff0f482b Jesse Brandeburg     2013-09-11  2625  		}
ea02e90b4b4978 Mitch Williams       2015-11-09  2626  	}
ea02e90b4b4978 Mitch Williams       2015-11-09  2627  out:
2818ccd95684d3 Jesse Brandeburg     2016-01-13  2628  	/* if something went=
 wrong then set the changed flag so we try again */
2818ccd95684d3 Jesse Brandeburg     2016-01-13  2629  	if (retval)
2818ccd95684d3 Jesse Brandeburg     2016-01-13  2630  		vsi->flags |=3D I40=
E_VSI_FLAG_FILTER_CHANGED;
2818ccd95684d3 Jesse Brandeburg     2016-01-13  2631  =

0da36b9774cc24 Jacob Keller         2017-04-19  2632  	clear_bit(__I40E_VSI=
_SYNCING_FILTERS, vsi->state);
ea02e90b4b4978 Mitch Williams       2015-11-09  2633  	return retval;
4a2ce27bb5f291 Jacob Keller         2016-10-05  2634  =

4a2ce27bb5f291 Jacob Keller         2016-10-05  2635  err_no_memory:
4a2ce27bb5f291 Jacob Keller         2016-10-05  2636  	/* Restore elements =
on the temporary add and delete lists */
4a2ce27bb5f291 Jacob Keller         2016-10-05  2637  	spin_lock_bh(&vsi->m=
ac_filter_hash_lock);
84f5ca6cf4ea1d Alan Brady           2016-10-05  2638  err_no_memory_locked:
671889e6740ac7 Jacob Keller         2016-12-02  2639  	i40e_undo_del_filter=
_entries(vsi, &tmp_del_list);
671889e6740ac7 Jacob Keller         2016-12-02  2640  	i40e_undo_add_filter=
_entries(vsi, &tmp_add_list);
4a2ce27bb5f291 Jacob Keller         2016-10-05  2641  	spin_unlock_bh(&vsi-=
>mac_filter_hash_lock);
4a2ce27bb5f291 Jacob Keller         2016-10-05  2642  =

4a2ce27bb5f291 Jacob Keller         2016-10-05  2643  	vsi->flags |=3D I40E=
_VSI_FLAG_FILTER_CHANGED;
0da36b9774cc24 Jacob Keller         2017-04-19  2644  	clear_bit(__I40E_VSI=
_SYNCING_FILTERS, vsi->state);
4a2ce27bb5f291 Jacob Keller         2016-10-05  2645  	return -ENOMEM;
41c445ff0f482b Jesse Brandeburg     2013-09-11  2646  }
41c445ff0f482b Jesse Brandeburg     2013-09-11  2647  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0055810310500105258==--

