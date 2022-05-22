Content-Type: multipart/mixed; boundary="===============0415016216502540320=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [dhowells-fs:rxrpc-next 2/7] net/rxrpc/peer_object.c:123:26: warning: Uninitialized variables: peer.rcu, peer.ref, peer.hash_key, peer.hash_link, peer.local, peer.error_targets, peer.service_conns, peer.keepalive_link, peer.last_tx_at, peer.service_conn_lock, peer.lock, peer.if_mtu, ...
Date: Sun, 22 May 2022 20:09:55 +0800
Message-ID: <202205222008.qCYVyxcC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0415016216502540320==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.g=
it rxrpc-next
head:   ff8a9d0bfd1189450a3048de45bcf4e4a2e95108
commit: 67b29a0a541efec0fa995456abfc142758e59872 [2/7] rxrpc: Use refcount_=
t rather than atomic_t
:::::: branch date: 29 hours ago
:::::: commit date: 3 days ago
compiler: arc-elf-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 67b29a0a541efec0fa995456abfc142758e59872
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/rxrpc/peer_object.c:123:26: warning: Uninitialized variables: peer.r=
cu, peer.ref, peer.hash_key, peer.hash_link, peer.local, peer.error_targets=
, peer.service_conns, peer.keepalive_link, peer.last_tx_at, peer.service_co=
nn_lock, peer.lock, peer.if_mtu, peer.mtu, peer.maxdata, peer.hdrsize, peer=
.debug_id, peer.srx, peer.rtt_input_lock, peer.rtt_last_req, peer.rtt_count=
, peer.srtt_us, peer.mdev_us, peer.mdev_max_us, peer.rttvar_us, peer.rto_j,=
 peer.backoff, peer.cong_cwnd [uninitvar]
     if (rxrpc_peer_cmp_key(peer, local, srx, hash_key) =3D=3D 0 &&
                            ^

vim +123 net/rxrpc/peer_object.c

be6e6707f6eec2 David Howells 2016-04-04  110  =

be6e6707f6eec2 David Howells 2016-04-04  111  /*
be6e6707f6eec2 David Howells 2016-04-04  112   * Look up a remote transport=
 endpoint for the specified address using RCU.
be6e6707f6eec2 David Howells 2016-04-04  113   */
be6e6707f6eec2 David Howells 2016-04-04  114  static struct rxrpc_peer *__r=
xrpc_lookup_peer_rcu(
be6e6707f6eec2 David Howells 2016-04-04  115  	struct rxrpc_local *local,
be6e6707f6eec2 David Howells 2016-04-04  116  	const struct sockaddr_rxrpc =
*srx,
be6e6707f6eec2 David Howells 2016-04-04  117  	unsigned long hash_key)
be6e6707f6eec2 David Howells 2016-04-04  118  {
be6e6707f6eec2 David Howells 2016-04-04  119  	struct rxrpc_peer *peer;
2baec2c3f854d1 David Howells 2017-05-24  120  	struct rxrpc_net *rxnet =3D =
local->rxnet;
be6e6707f6eec2 David Howells 2016-04-04  121  =

2baec2c3f854d1 David Howells 2017-05-24  122  	hash_for_each_possible_rcu(r=
xnet->peer_hash, peer, hash_link, hash_key) {
0099dc589bfa7c David Howells 2018-09-27 @123  		if (rxrpc_peer_cmp_key(peer=
, local, srx, hash_key) =3D=3D 0 &&
67b29a0a541efe David Howells 2022-05-11  124  		    refcount_read(&peer->re=
f) > 0)
be6e6707f6eec2 David Howells 2016-04-04  125  			return peer;
be6e6707f6eec2 David Howells 2016-04-04  126  	}
be6e6707f6eec2 David Howells 2016-04-04  127  =

be6e6707f6eec2 David Howells 2016-04-04  128  	return NULL;
be6e6707f6eec2 David Howells 2016-04-04  129  }
be6e6707f6eec2 David Howells 2016-04-04  130  =


:::::: The code at line 123 was first introduced by commit
:::::: 0099dc589bfa7caf6f2608c4cbc1181cfee22b0c rxrpc: Make service call ha=
ndling more robust

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0415016216502540320==--

