Content-Type: multipart/mixed; boundary="===============6430907565831287969=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/kcm/kcmsock.c:645 kcm_write_msgs() error: we previously assumed 'psock' could be null (see line 585)
Date: Sat, 22 Jan 2022 03:31:25 +0800
Message-ID: <202201220354.fJ3VzqBt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6430907565831287969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9b57f458985742bd1c585f4c7f36d04634ce1143
commit: 1e688dd2a3d6759d416616ff07afc4bb836c4213 powerpc/bug: Provide bette=
r flexibility to WARN_ON/__WARN_FLAGS() with asm goto
date:   5 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 months ago
config: powerpc64-randconfig-m031-20220120 (https://download.01.org/0day-ci=
/archive/20220122/202201220354.fJ3VzqBt-lkp(a)intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/kcm/kcmsock.c:645 kcm_write_msgs() error: we previously assumed 'psock'=
 could be null (see line 585)

vim +/psock +645 net/kcm/kcmsock.c

cd6e111bf5be5c7 Tom Herbert             2016-03-07  569  =

ab7ac4eb9832e32 Tom Herbert             2016-03-07  570  /* Write any messa=
ges ready on the kcm socket.  Called with kcm sock lock
ab7ac4eb9832e32 Tom Herbert             2016-03-07  571   * held.  Return b=
ytes actually sent or error.
ab7ac4eb9832e32 Tom Herbert             2016-03-07  572   */
ab7ac4eb9832e32 Tom Herbert             2016-03-07  573  static int kcm_wri=
te_msgs(struct kcm_sock *kcm)
ab7ac4eb9832e32 Tom Herbert             2016-03-07  574  {
ab7ac4eb9832e32 Tom Herbert             2016-03-07  575  	struct sock *sk =
=3D &kcm->sk;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  576  	struct kcm_psock =
*psock;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  577  	struct sk_buff *s=
kb, *head;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  578  	struct kcm_tx_msg=
 *txm;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  579  	unsigned short fr=
agidx, frag_offset;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  580  	unsigned int sent=
, total_sent =3D 0;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  581  	int ret =3D 0;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  582  =

ab7ac4eb9832e32 Tom Herbert             2016-03-07  583  	kcm->tx_wait_more=
 =3D false;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  584  	psock =3D kcm->tx=
_psock;
ab7ac4eb9832e32 Tom Herbert             2016-03-07 @585  	if (unlikely(psoc=
k && psock->tx_stopped)) {
ab7ac4eb9832e32 Tom Herbert             2016-03-07  586  		/* A reserved ps=
ock was aborted asynchronously. Unreserve
ab7ac4eb9832e32 Tom Herbert             2016-03-07  587  		 * it and we'll =
retry the message.
ab7ac4eb9832e32 Tom Herbert             2016-03-07  588  		 */
ab7ac4eb9832e32 Tom Herbert             2016-03-07  589  		unreserve_psock(=
kcm);
cd6e111bf5be5c7 Tom Herbert             2016-03-07  590  		kcm_report_tx_re=
try(kcm);
ab7ac4eb9832e32 Tom Herbert             2016-03-07  591  		if (skb_queue_em=
pty(&sk->sk_write_queue))
ab7ac4eb9832e32 Tom Herbert             2016-03-07  592  			return 0;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  593  =

ab7ac4eb9832e32 Tom Herbert             2016-03-07  594  		kcm_tx_msg(skb_p=
eek(&sk->sk_write_queue))->sent =3D 0;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  595  =

ab7ac4eb9832e32 Tom Herbert             2016-03-07  596  	} else if (skb_qu=
eue_empty(&sk->sk_write_queue)) {
ab7ac4eb9832e32 Tom Herbert             2016-03-07  597  		return 0;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  598  	}
ab7ac4eb9832e32 Tom Herbert             2016-03-07  599  =

ab7ac4eb9832e32 Tom Herbert             2016-03-07  600  	head =3D skb_peek=
(&sk->sk_write_queue);
ab7ac4eb9832e32 Tom Herbert             2016-03-07  601  	txm =3D kcm_tx_ms=
g(head);
ab7ac4eb9832e32 Tom Herbert             2016-03-07  602  =

ab7ac4eb9832e32 Tom Herbert             2016-03-07  603  	if (txm->sent) {
ab7ac4eb9832e32 Tom Herbert             2016-03-07  604  		/* Send of first=
 skbuff in queue already in progress */
ab7ac4eb9832e32 Tom Herbert             2016-03-07  605  		if (WARN_ON(!pso=
ck)) {
ab7ac4eb9832e32 Tom Herbert             2016-03-07  606  			ret =3D -EINVAL;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  607  			goto out;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  608  		}
ab7ac4eb9832e32 Tom Herbert             2016-03-07  609  		sent =3D txm->se=
nt;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  610  		frag_offset =3D =
txm->frag_offset;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  611  		fragidx =3D txm-=
>fragidx;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  612  		skb =3D txm->fra=
g_skb;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  613  =

ab7ac4eb9832e32 Tom Herbert             2016-03-07  614  		goto do_frag;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  615  	}
ab7ac4eb9832e32 Tom Herbert             2016-03-07  616  =

ab7ac4eb9832e32 Tom Herbert             2016-03-07  617  try_again:
ab7ac4eb9832e32 Tom Herbert             2016-03-07  618  	psock =3D reserve=
_psock(kcm);
ab7ac4eb9832e32 Tom Herbert             2016-03-07  619  	if (!psock)
ab7ac4eb9832e32 Tom Herbert             2016-03-07  620  		goto out;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  621  =

ab7ac4eb9832e32 Tom Herbert             2016-03-07  622  	do {
ab7ac4eb9832e32 Tom Herbert             2016-03-07  623  		skb =3D head;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  624  		txm =3D kcm_tx_m=
sg(head);
ab7ac4eb9832e32 Tom Herbert             2016-03-07  625  		sent =3D 0;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  626  =

ab7ac4eb9832e32 Tom Herbert             2016-03-07  627  do_frag_list:
ab7ac4eb9832e32 Tom Herbert             2016-03-07  628  		if (WARN_ON(!skb=
_shinfo(skb)->nr_frags)) {
ab7ac4eb9832e32 Tom Herbert             2016-03-07  629  			ret =3D -EINVAL;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  630  			goto out;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  631  		}
ab7ac4eb9832e32 Tom Herbert             2016-03-07  632  =

ab7ac4eb9832e32 Tom Herbert             2016-03-07  633  		for (fragidx =3D=
 0; fragidx < skb_shinfo(skb)->nr_frags;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  634  		     fragidx++) {
ab7ac4eb9832e32 Tom Herbert             2016-03-07  635  			skb_frag_t *fra=
g;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  636  =

ab7ac4eb9832e32 Tom Herbert             2016-03-07  637  			frag_offset =3D=
 0;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  638  do_frag:
ab7ac4eb9832e32 Tom Herbert             2016-03-07  639  			frag =3D &skb_s=
hinfo(skb)->frags[fragidx];
d8e18a516f8f674 Matthew Wilcox (Oracle  2019-07-22  640) 			if (WARN_ON(!sk=
b_frag_size(frag))) {
ab7ac4eb9832e32 Tom Herbert             2016-03-07  641  				ret =3D -EINVA=
L;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  642  				goto out;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  643  			}
ab7ac4eb9832e32 Tom Herbert             2016-03-07  644  =

ab7ac4eb9832e32 Tom Herbert             2016-03-07 @645  			ret =3D kernel_=
sendpage(psock->sk->sk_socket,
d8e18a516f8f674 Matthew Wilcox (Oracle  2019-07-22  646) 					      skb_fra=
g_page(frag),
b54c9d5bd6e38ed Jonathan Lemon          2019-07-30  647  					      skb_fra=
g_off(frag) + frag_offset,
d8e18a516f8f674 Matthew Wilcox (Oracle  2019-07-22  648) 					      skb_fra=
g_size(frag) - frag_offset,
ab7ac4eb9832e32 Tom Herbert             2016-03-07  649  					      MSG_DON=
TWAIT);
ab7ac4eb9832e32 Tom Herbert             2016-03-07  650  			if (ret <=3D 0)=
 {
ab7ac4eb9832e32 Tom Herbert             2016-03-07  651  				if (ret =3D=3D=
 -EAGAIN) {
ab7ac4eb9832e32 Tom Herbert             2016-03-07  652  					/* Save state=
 to try again when there's
ab7ac4eb9832e32 Tom Herbert             2016-03-07  653  					 * write spac=
e on the socket
ab7ac4eb9832e32 Tom Herbert             2016-03-07  654  					 */
ab7ac4eb9832e32 Tom Herbert             2016-03-07  655  					txm->sent =3D=
 sent;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  656  					txm->frag_off=
set =3D frag_offset;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  657  					txm->fragidx =
=3D fragidx;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  658  					txm->frag_skb=
 =3D skb;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  659  =

ab7ac4eb9832e32 Tom Herbert             2016-03-07  660  					ret =3D 0;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  661  					goto out;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  662  				}
ab7ac4eb9832e32 Tom Herbert             2016-03-07  663  =

ab7ac4eb9832e32 Tom Herbert             2016-03-07  664  				/* Hard failur=
e in sending message, abort this
ab7ac4eb9832e32 Tom Herbert             2016-03-07  665  				 * psock since=
 it has lost framing
71a2fae50895b32 Bhaskar Chowdhury       2021-03-27  666  				 * synchroniza=
tion and retry sending the
ab7ac4eb9832e32 Tom Herbert             2016-03-07  667  				 * message fro=
m the beginning.
ab7ac4eb9832e32 Tom Herbert             2016-03-07  668  				 */
ab7ac4eb9832e32 Tom Herbert             2016-03-07  669  				kcm_abort_tx_p=
sock(psock, ret ? -ret : EPIPE,
ab7ac4eb9832e32 Tom Herbert             2016-03-07  670  						   true);
ab7ac4eb9832e32 Tom Herbert             2016-03-07  671  				unreserve_psoc=
k(kcm);
ab7ac4eb9832e32 Tom Herbert             2016-03-07  672  =

ab7ac4eb9832e32 Tom Herbert             2016-03-07  673  				txm->sent =3D =
0;
cd6e111bf5be5c7 Tom Herbert             2016-03-07  674  				kcm_report_tx_=
retry(kcm);
ab7ac4eb9832e32 Tom Herbert             2016-03-07  675  				ret =3D 0;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  676  =

ab7ac4eb9832e32 Tom Herbert             2016-03-07  677  				goto try_again;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  678  			}
ab7ac4eb9832e32 Tom Herbert             2016-03-07  679  =

ab7ac4eb9832e32 Tom Herbert             2016-03-07  680  			sent +=3D ret;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  681  			frag_offset +=
=3D ret;
cd6e111bf5be5c7 Tom Herbert             2016-03-07  682  			KCM_STATS_ADD(p=
sock->stats.tx_bytes, ret);
d8e18a516f8f674 Matthew Wilcox (Oracle  2019-07-22  683) 			if (frag_offset=
 < skb_frag_size(frag)) {
ab7ac4eb9832e32 Tom Herbert             2016-03-07  684  				/* Not finishe=
d with this frag */
ab7ac4eb9832e32 Tom Herbert             2016-03-07  685  				goto do_frag;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  686  			}
ab7ac4eb9832e32 Tom Herbert             2016-03-07  687  		}
ab7ac4eb9832e32 Tom Herbert             2016-03-07  688  =

ab7ac4eb9832e32 Tom Herbert             2016-03-07  689  		if (skb =3D=3D h=
ead) {
ab7ac4eb9832e32 Tom Herbert             2016-03-07  690  			if (skb_has_fra=
g_list(skb)) {
ab7ac4eb9832e32 Tom Herbert             2016-03-07  691  				skb =3D skb_sh=
info(skb)->frag_list;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  692  				goto do_frag_l=
ist;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  693  			}
ab7ac4eb9832e32 Tom Herbert             2016-03-07  694  		} else if (skb->=
next) {
ab7ac4eb9832e32 Tom Herbert             2016-03-07  695  			skb =3D skb->ne=
xt;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  696  			goto do_frag_li=
st;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  697  		}
ab7ac4eb9832e32 Tom Herbert             2016-03-07  698  =

ab7ac4eb9832e32 Tom Herbert             2016-03-07  699  		/* Successfully =
sent the whole packet, account for it. */
ab7ac4eb9832e32 Tom Herbert             2016-03-07  700  		skb_dequeue(&sk-=
>sk_write_queue);
ab7ac4eb9832e32 Tom Herbert             2016-03-07  701  		kfree_skb(head);
ab7ac4eb9832e32 Tom Herbert             2016-03-07  702  		sk->sk_wmem_queu=
ed -=3D sent;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  703  		total_sent +=3D =
sent;
cd6e111bf5be5c7 Tom Herbert             2016-03-07  704  		KCM_STATS_INCR(p=
sock->stats.tx_msgs);
ab7ac4eb9832e32 Tom Herbert             2016-03-07  705  	} while ((head =
=3D skb_peek(&sk->sk_write_queue)));
ab7ac4eb9832e32 Tom Herbert             2016-03-07  706  out:
ab7ac4eb9832e32 Tom Herbert             2016-03-07  707  	if (!head) {
ab7ac4eb9832e32 Tom Herbert             2016-03-07  708  		/* Done with all=
 queued messages. */
ab7ac4eb9832e32 Tom Herbert             2016-03-07  709  		WARN_ON(!skb_que=
ue_empty(&sk->sk_write_queue));
ab7ac4eb9832e32 Tom Herbert             2016-03-07  710  		unreserve_psock(=
kcm);
ab7ac4eb9832e32 Tom Herbert             2016-03-07  711  	}
ab7ac4eb9832e32 Tom Herbert             2016-03-07  712  =

ab7ac4eb9832e32 Tom Herbert             2016-03-07  713  	/* Check if write=
 space is available */
ab7ac4eb9832e32 Tom Herbert             2016-03-07  714  	sk->sk_write_spac=
e(sk);
ab7ac4eb9832e32 Tom Herbert             2016-03-07  715  =

ab7ac4eb9832e32 Tom Herbert             2016-03-07  716  	return total_sent=
 ? : ret;
ab7ac4eb9832e32 Tom Herbert             2016-03-07  717  }
ab7ac4eb9832e32 Tom Herbert             2016-03-07  718  =


:::::: The code at line 645 was first introduced by commit
:::::: ab7ac4eb9832e32a09f4e8042705484d2fb0aad3 kcm: Kernel Connection Mult=
iplexor module

:::::: TO: Tom Herbert <tom@herbertland.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6430907565831287969==--

