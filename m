Content-Type: multipart/mixed; boundary="===============8050226539344012981=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/veth.c:1612:68: warning: Parameter 'tb' can be declared with const [constParameter]
Date: Wed, 13 Apr 2022 00:16:55 +0800
Message-ID: <202204130000.rIiu28CD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8050226539344012981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Paolo Abeni <pabeni@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e
commit: 9d3684c24a5232c2d7ea8f8a3e60fe235e6a9867 veth: create by default nr=
_possible_cpus queues
date:   9 months ago
:::::: branch date: 2 days ago
:::::: commit date: 9 months ago
compiler: arc-elf-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 9d3684c24a5232c2d7ea8f8a3e60fe235e6a9867
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/nfc/llcp_sock.c:622:29: warning: Uninitialized variables: lsk.sk, ls=
k.dev, lsk.local, lsk.target_idx, lsk.nfc_protocol, lsk.ssap, lsk.dsap, lsk=
.service_name, lsk.service_name_len, lsk.rw, lsk.miux, lsk.remote_rw, lsk.r=
emote_miu, lsk.send_n, lsk.send_ack_n, lsk.recv_n, lsk.recv_ack_n, lsk.remo=
te_ready, lsk.reserved_ssap, lsk.tx_queue, lsk.tx_pending_queue, lsk.accept=
_queue, lsk.parent [uninitvar]
      nfc_llcp_send_disconnect(lsk);
                               ^
--
   drivers/net/veth.c:1509:18: warning: Boolean result is used in bitwise o=
peration. Clarify expression with parentheses. [clarifyCondition]
    if ((!!old_prog ^ !!prog) && peer)
                    ^
   drivers/net/veth.c:146:5: warning: %u in format string (no. 1) requires =
'unsigned int' but the argument type is 'signed int'. [invalidPrintfArgType=
_uint]
       snprintf(p, ETH_GSTRING_LEN,
       ^
   drivers/net/veth.c:154:5: warning: %u in format string (no. 1) requires =
'unsigned int' but the argument type is 'signed int'. [invalidPrintfArgType=
_uint]
       snprintf(p, ETH_GSTRING_LEN,
       ^
>> drivers/net/veth.c:1612:68: warning: Parameter 'tb' can be declared with=
 const [constParameter]
   static int veth_init_queues(struct net_device *dev, struct nlattr *tb[])
                                                                      ^
   drivers/net/veth.c:1630:40: warning: Parameter 'data' can be declared wi=
th const [constParameter]
      struct nlattr *tb[], struct nlattr *data[],
                                          ^
>> net/mpls/af_mpls.c:693:6: warning: Redundant initialization for 'err'. T=
he initialized value is overwritten before it is read. [redundantInitializa=
tion]
    err =3D -EINVAL;
        ^
   net/mpls/af_mpls.c:683:10: note: err is initialized
    int err =3D -ENODEV;
            ^
   net/mpls/af_mpls.c:693:6: note: err is overwritten
    err =3D -EINVAL;
        ^
>> net/mpls/af_mpls.c:2494:41: warning: Found suspicious operator ',' [cons=
tStatement]
    struct mpls_route __rcu **labels =3D NULL, **old;
                                           ^

vim +/tb +1612 drivers/net/veth.c

d3256efd8e8b23 Paolo Abeni 2021-04-09  1611  =

9d3684c24a5232 Paolo Abeni 2021-07-20 @1612  static int veth_init_queues(st=
ruct net_device *dev, struct nlattr *tb[])
9d3684c24a5232 Paolo Abeni 2021-07-20  1613  {
9d3684c24a5232 Paolo Abeni 2021-07-20  1614  	int err;
9d3684c24a5232 Paolo Abeni 2021-07-20  1615  =

9d3684c24a5232 Paolo Abeni 2021-07-20  1616  	if (!tb[IFLA_NUM_TX_QUEUES] &=
& dev->num_tx_queues > 1) {
9d3684c24a5232 Paolo Abeni 2021-07-20  1617  		err =3D netif_set_real_num_t=
x_queues(dev, 1);
9d3684c24a5232 Paolo Abeni 2021-07-20  1618  		if (err)
9d3684c24a5232 Paolo Abeni 2021-07-20  1619  			return err;
9d3684c24a5232 Paolo Abeni 2021-07-20  1620  	}
9d3684c24a5232 Paolo Abeni 2021-07-20  1621  	if (!tb[IFLA_NUM_RX_QUEUES] &=
& dev->num_rx_queues > 1) {
9d3684c24a5232 Paolo Abeni 2021-07-20  1622  		err =3D netif_set_real_num_r=
x_queues(dev, 1);
9d3684c24a5232 Paolo Abeni 2021-07-20  1623  		if (err)
9d3684c24a5232 Paolo Abeni 2021-07-20  1624  			return err;
9d3684c24a5232 Paolo Abeni 2021-07-20  1625  	}
9d3684c24a5232 Paolo Abeni 2021-07-20  1626  	return 0;
9d3684c24a5232 Paolo Abeni 2021-07-20  1627  }
9d3684c24a5232 Paolo Abeni 2021-07-20  1628  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8050226539344012981==--

