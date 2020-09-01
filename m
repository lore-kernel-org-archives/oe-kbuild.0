Content-Type: multipart/mixed; boundary="===============4887020896002591371=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireguard/netlink.c:257:6: warning: Variable 'ret' is reassigned a value before the old one has been used.
Date: Tue, 01 Sep 2020 11:40:57 +0800
Message-ID: <202009011152.9iiY9hDM%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4887020896002591371==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Jason A. Donenfeld" <zx2c4@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b51594df17d0ce80b9f9f35394a1f42d7ac94472
commit: e7096c131e5161fa3b8e52a650d7719d2857adfd net: WireGuard secure netw=
ork tunnel
date:   9 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 9 months ago
compiler: or1k-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/net/wireguard/netlink.c:257:6: warning: Variable 'ret' is reassi=
gned a value before the old one has been used. [redundantAssignment]
    ret =3D 0;
        ^
   drivers/net/wireguard/netlink.c:216:0: note: Variable 'ret' is reassigne=
d a value before the old one has been used.
    int ret =3D -EMSGSIZE;
   ^
   drivers/net/wireguard/netlink.c:257:6: note: Variable 'ret' is reassigne=
d a value before the old one has been used.
    ret =3D 0;
        ^
   drivers/net/wireguard/netlink.c:376:6: warning: Variable 'ret' is reassi=
gned a value before the old one has been used. [redundantAssignment]
    ret =3D -EOPNOTSUPP;
        ^
   drivers/net/wireguard/netlink.c:364:6: note: Variable 'ret' is reassigne=
d a value before the old one has been used.
    ret =3D -EINVAL;
        ^
   drivers/net/wireguard/netlink.c:376:6: note: Variable 'ret' is reassigne=
d a value before the old one has been used.
    ret =3D -EOPNOTSUPP;
        ^
   drivers/net/wireguard/netlink.c:380:6: warning: Variable 'ret' is reassi=
gned a value before the old one has been used. [redundantAssignment]
    ret =3D -EPFNOSUPPORT;
        ^
   drivers/net/wireguard/netlink.c:376:6: note: Variable 'ret' is reassigne=
d a value before the old one has been used.
    ret =3D -EOPNOTSUPP;
        ^
   drivers/net/wireguard/netlink.c:380:6: note: Variable 'ret' is reassigne=
d a value before the old one has been used.
    ret =3D -EPFNOSUPPORT;
        ^
   drivers/net/wireguard/netlink.c:388:6: warning: Variable 'ret' is reassi=
gned a value before the old one has been used. [redundantAssignment]
    ret =3D 0;
        ^
   drivers/net/wireguard/netlink.c:380:6: note: Variable 'ret' is reassigne=
d a value before the old one has been used.
    ret =3D -EPFNOSUPPORT;
        ^
   drivers/net/wireguard/netlink.c:388:6: note: Variable 'ret' is reassigne=
d a value before the old one has been used.
    ret =3D 0;
        ^
   drivers/net/wireguard/netlink.c:518:6: warning: Variable 'ret' is reassi=
gned a value before the old one has been used. [redundantAssignment]
    ret =3D -EPERM;
        ^
   drivers/net/wireguard/netlink.c:514:6: note: Variable 'ret' is reassigne=
d a value before the old one has been used.
    ret =3D -EOPNOTSUPP;
        ^
   drivers/net/wireguard/netlink.c:518:6: note: Variable 'ret' is reassigne=
d a value before the old one has been used.
    ret =3D -EPERM;
        ^
   drivers/net/wireguard/netlink.c:596:6: warning: Variable 'ret' is reassi=
gned a value before the old one has been used. [redundantAssignment]
    ret =3D 0;
        ^
   drivers/net/wireguard/netlink.c:518:6: note: Variable 'ret' is reassigne=
d a value before the old one has been used.
    ret =3D -EPERM;
        ^
   drivers/net/wireguard/netlink.c:596:6: note: Variable 'ret' is reassigne=
d a value before the old one has been used.
    ret =3D 0;
        ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3De7096c131e5161fa3b8e52a650d7719d2857adfd
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout e7096c131e5161fa3b8e52a650d7719d2857adfd
vim +/ret +257 drivers/net/wireguard/netlink.c

e7096c131e5161 Jason A. Donenfeld 2019-12-09  209  =

e7096c131e5161 Jason A. Donenfeld 2019-12-09  210  static int wg_get_device=
_dump(struct sk_buff *skb, struct netlink_callback *cb)
e7096c131e5161 Jason A. Donenfeld 2019-12-09  211  {
e7096c131e5161 Jason A. Donenfeld 2019-12-09  212  	struct wg_peer *peer, *=
next_peer_cursor;
e7096c131e5161 Jason A. Donenfeld 2019-12-09  213  	struct dump_ctx *ctx =
=3D DUMP_CTX(cb);
e7096c131e5161 Jason A. Donenfeld 2019-12-09  214  	struct wg_device *wg =
=3D ctx->wg;
e7096c131e5161 Jason A. Donenfeld 2019-12-09  215  	struct nlattr *peers_ne=
st;
e7096c131e5161 Jason A. Donenfeld 2019-12-09  216  	int ret =3D -EMSGSIZE;
e7096c131e5161 Jason A. Donenfeld 2019-12-09  217  	bool done =3D true;
e7096c131e5161 Jason A. Donenfeld 2019-12-09  218  	void *hdr;
e7096c131e5161 Jason A. Donenfeld 2019-12-09  219  =

e7096c131e5161 Jason A. Donenfeld 2019-12-09  220  	rtnl_lock();
e7096c131e5161 Jason A. Donenfeld 2019-12-09  221  	mutex_lock(&wg->device_=
update_lock);
e7096c131e5161 Jason A. Donenfeld 2019-12-09  222  	cb->seq =3D wg->device_=
update_gen;
e7096c131e5161 Jason A. Donenfeld 2019-12-09  223  	next_peer_cursor =3D ct=
x->next_peer;
e7096c131e5161 Jason A. Donenfeld 2019-12-09  224  =

e7096c131e5161 Jason A. Donenfeld 2019-12-09  225  	hdr =3D genlmsg_put(skb=
, NETLINK_CB(cb->skb).portid, cb->nlh->nlmsg_seq,
e7096c131e5161 Jason A. Donenfeld 2019-12-09  226  			  &genl_family, NLM_F=
_MULTI, WG_CMD_GET_DEVICE);
e7096c131e5161 Jason A. Donenfeld 2019-12-09  227  	if (!hdr)
e7096c131e5161 Jason A. Donenfeld 2019-12-09  228  		goto out;
e7096c131e5161 Jason A. Donenfeld 2019-12-09  229  	genl_dump_check_consist=
ent(cb, hdr);
e7096c131e5161 Jason A. Donenfeld 2019-12-09  230  =

e7096c131e5161 Jason A. Donenfeld 2019-12-09  231  	if (!ctx->next_peer) {
e7096c131e5161 Jason A. Donenfeld 2019-12-09  232  		if (nla_put_u16(skb, W=
GDEVICE_A_LISTEN_PORT,
e7096c131e5161 Jason A. Donenfeld 2019-12-09  233  				wg->incoming_port) ||
e7096c131e5161 Jason A. Donenfeld 2019-12-09  234  		    nla_put_u32(skb, W=
GDEVICE_A_FWMARK, wg->fwmark) ||
e7096c131e5161 Jason A. Donenfeld 2019-12-09  235  		    nla_put_u32(skb, W=
GDEVICE_A_IFINDEX, wg->dev->ifindex) ||
e7096c131e5161 Jason A. Donenfeld 2019-12-09  236  		    nla_put_string(skb=
, WGDEVICE_A_IFNAME, wg->dev->name))
e7096c131e5161 Jason A. Donenfeld 2019-12-09  237  			goto out;
e7096c131e5161 Jason A. Donenfeld 2019-12-09  238  =

e7096c131e5161 Jason A. Donenfeld 2019-12-09  239  		down_read(&wg->static_=
identity.lock);
e7096c131e5161 Jason A. Donenfeld 2019-12-09  240  		if (wg->static_identit=
y.has_identity) {
e7096c131e5161 Jason A. Donenfeld 2019-12-09  241  			if (nla_put(skb, WGDE=
VICE_A_PRIVATE_KEY,
e7096c131e5161 Jason A. Donenfeld 2019-12-09  242  				    NOISE_PUBLIC_KEY=
_LEN,
e7096c131e5161 Jason A. Donenfeld 2019-12-09  243  				    wg->static_ident=
ity.static_private) ||
e7096c131e5161 Jason A. Donenfeld 2019-12-09  244  			    nla_put(skb, WGDE=
VICE_A_PUBLIC_KEY,
e7096c131e5161 Jason A. Donenfeld 2019-12-09  245  				    NOISE_PUBLIC_KEY=
_LEN,
e7096c131e5161 Jason A. Donenfeld 2019-12-09  246  				    wg->static_ident=
ity.static_public)) {
e7096c131e5161 Jason A. Donenfeld 2019-12-09  247  				up_read(&wg->static_=
identity.lock);
e7096c131e5161 Jason A. Donenfeld 2019-12-09  248  				goto out;
e7096c131e5161 Jason A. Donenfeld 2019-12-09  249  			}
e7096c131e5161 Jason A. Donenfeld 2019-12-09  250  		}
e7096c131e5161 Jason A. Donenfeld 2019-12-09  251  		up_read(&wg->static_id=
entity.lock);
e7096c131e5161 Jason A. Donenfeld 2019-12-09  252  	}
e7096c131e5161 Jason A. Donenfeld 2019-12-09  253  =

e7096c131e5161 Jason A. Donenfeld 2019-12-09  254  	peers_nest =3D nla_nest=
_start(skb, WGDEVICE_A_PEERS);
e7096c131e5161 Jason A. Donenfeld 2019-12-09  255  	if (!peers_nest)
e7096c131e5161 Jason A. Donenfeld 2019-12-09  256  		goto out;
e7096c131e5161 Jason A. Donenfeld 2019-12-09 @257  	ret =3D 0;
e7096c131e5161 Jason A. Donenfeld 2019-12-09  258  	/* If the last cursor w=
as removed via list_del_init in peer_remove, then
e7096c131e5161 Jason A. Donenfeld 2019-12-09  259  	 * we just treat this t=
he same as there being no more peers left. The
e7096c131e5161 Jason A. Donenfeld 2019-12-09  260  	 * reason is that seq_n=
r should indicate to userspace that this isn't a
e7096c131e5161 Jason A. Donenfeld 2019-12-09  261  	 * coherent dump anyway=
, so they'll try again.
e7096c131e5161 Jason A. Donenfeld 2019-12-09  262  	 */
e7096c131e5161 Jason A. Donenfeld 2019-12-09  263  	if (list_empty(&wg->pee=
r_list) ||
e7096c131e5161 Jason A. Donenfeld 2019-12-09  264  	    (ctx->next_peer && =
list_empty(&ctx->next_peer->peer_list))) {
e7096c131e5161 Jason A. Donenfeld 2019-12-09  265  		nla_nest_cancel(skb, p=
eers_nest);
e7096c131e5161 Jason A. Donenfeld 2019-12-09  266  		goto out;
e7096c131e5161 Jason A. Donenfeld 2019-12-09  267  	}
e7096c131e5161 Jason A. Donenfeld 2019-12-09  268  	lockdep_assert_held(&wg=
->device_update_lock);
e7096c131e5161 Jason A. Donenfeld 2019-12-09  269  	peer =3D list_prepare_e=
ntry(ctx->next_peer, &wg->peer_list, peer_list);
e7096c131e5161 Jason A. Donenfeld 2019-12-09  270  	list_for_each_entry_con=
tinue(peer, &wg->peer_list, peer_list) {
e7096c131e5161 Jason A. Donenfeld 2019-12-09  271  		if (get_peer(peer, skb=
, ctx)) {
e7096c131e5161 Jason A. Donenfeld 2019-12-09  272  			done =3D false;
e7096c131e5161 Jason A. Donenfeld 2019-12-09  273  			break;
e7096c131e5161 Jason A. Donenfeld 2019-12-09  274  		}
e7096c131e5161 Jason A. Donenfeld 2019-12-09  275  		next_peer_cursor =3D p=
eer;
e7096c131e5161 Jason A. Donenfeld 2019-12-09  276  	}
e7096c131e5161 Jason A. Donenfeld 2019-12-09  277  	nla_nest_end(skb, peers=
_nest);
e7096c131e5161 Jason A. Donenfeld 2019-12-09  278  =

e7096c131e5161 Jason A. Donenfeld 2019-12-09  279  out:
e7096c131e5161 Jason A. Donenfeld 2019-12-09  280  	if (!ret && !done && ne=
xt_peer_cursor)
e7096c131e5161 Jason A. Donenfeld 2019-12-09  281  		wg_peer_get(next_peer_=
cursor);
e7096c131e5161 Jason A. Donenfeld 2019-12-09  282  	wg_peer_put(ctx->next_p=
eer);
e7096c131e5161 Jason A. Donenfeld 2019-12-09  283  	mutex_unlock(&wg->devic=
e_update_lock);
e7096c131e5161 Jason A. Donenfeld 2019-12-09  284  	rtnl_unlock();
e7096c131e5161 Jason A. Donenfeld 2019-12-09  285  =

e7096c131e5161 Jason A. Donenfeld 2019-12-09  286  	if (ret) {
e7096c131e5161 Jason A. Donenfeld 2019-12-09  287  		genlmsg_cancel(skb, hd=
r);
e7096c131e5161 Jason A. Donenfeld 2019-12-09  288  		return ret;
e7096c131e5161 Jason A. Donenfeld 2019-12-09  289  	}
e7096c131e5161 Jason A. Donenfeld 2019-12-09  290  	genlmsg_end(skb, hdr);
e7096c131e5161 Jason A. Donenfeld 2019-12-09  291  	if (done) {
e7096c131e5161 Jason A. Donenfeld 2019-12-09  292  		ctx->next_peer =3D NUL=
L;
e7096c131e5161 Jason A. Donenfeld 2019-12-09  293  		return 0;
e7096c131e5161 Jason A. Donenfeld 2019-12-09  294  	}
e7096c131e5161 Jason A. Donenfeld 2019-12-09  295  	ctx->next_peer =3D next=
_peer_cursor;
e7096c131e5161 Jason A. Donenfeld 2019-12-09  296  	return skb->len;
e7096c131e5161 Jason A. Donenfeld 2019-12-09  297  =

e7096c131e5161 Jason A. Donenfeld 2019-12-09  298  	/* At this point, we ca=
n't really deal ourselves with safely zeroing out
e7096c131e5161 Jason A. Donenfeld 2019-12-09  299  	 * the private key mate=
rial after usage. This will need an additional API
e7096c131e5161 Jason A. Donenfeld 2019-12-09  300  	 * in the kernel for ma=
rking skbs as zero_on_free.
e7096c131e5161 Jason A. Donenfeld 2019-12-09  301  	 */
e7096c131e5161 Jason A. Donenfeld 2019-12-09  302  }
e7096c131e5161 Jason A. Donenfeld 2019-12-09  303  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4887020896002591371==--

