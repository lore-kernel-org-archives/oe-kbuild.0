Content-Type: multipart/mixed; boundary="===============5901817891318505895=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/acpi/acpi_ipmi.c:361:14: warning: Uninitialized variables: iter.head, iter.addr, iter.tx_msgid, iter.tx_complete, iter.tx_message, iter.msg_done, iter.rx_len, iter.device, iter.kref [uninitvar]
Date: Sun, 10 Apr 2022 10:54:41 +0800
Message-ID: <202204101054.ZL5oLwuR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5901817891318505895==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jakob Koschel <jakobkoschel@gmail.com>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e1f700ebd6bea293abe3c7e2807b252018efde01
commit: 26de0ab9841a1610a477d9b07c024b9bb6d39f98 ACPI: IPMI: replace usage =
of found with dedicated list iterator variable
date:   2 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 2 weeks ago
compiler: ia64-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 26de0ab9841a1610a477d9b07c024b9bb6d39f98
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> drivers/md/dm-integrity.c:4493:7: warning: Local variable 'r' shadows ou=
ter variable [shadowVariable]
     int r;
         ^
   drivers/md/dm-integrity.c:3966:6: note: Shadowed declaration
    int r;
        ^
   drivers/md/dm-integrity.c:4493:7: note: Shadow variable
     int r;
         ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/acpi/acpi_ipmi.c:361:14: warning: Uninitialized variables: iter.=
head, iter.addr, iter.tx_msgid, iter.tx_complete, iter.tx_message, iter.msg=
_done, iter.rx_len, iter.device, iter.kref [uninitvar]
     if (msg =3D=3D iter) {
                ^
>> drivers/acpi/acpi_ipmi.c:488:13: warning: Uninitialized variable: iter->=
ipmi_ifnum [uninitvar]
     if (iter->ipmi_ifnum !=3D iface) {
               ^
--
>> drivers/md/dm-integrity.c:2268:3: warning: Address of local auto-variabl=
e assigned to a function parameter. [autoVariables]
     dio->completion =3D &read_comp;
     ^

vim +361 drivers/acpi/acpi_ipmi.c

7b9844772237e3 Lv Zheng      2013-09-13  352  =

7b9844772237e3 Lv Zheng      2013-09-13  353  static void ipmi_cancel_tx_ms=
g(struct acpi_ipmi_device *ipmi,
7b9844772237e3 Lv Zheng      2013-09-13  354  			       struct acpi_ipmi_ms=
g *msg)
7b9844772237e3 Lv Zheng      2013-09-13  355  {
26de0ab9841a16 Jakob Koschel 2022-03-24  356  	struct acpi_ipmi_msg *tx_msg=
 =3D NULL, *iter, *temp;
7b9844772237e3 Lv Zheng      2013-09-13  357  	unsigned long flags;
7b9844772237e3 Lv Zheng      2013-09-13  358  =

7b9844772237e3 Lv Zheng      2013-09-13  359  	spin_lock_irqsave(&ipmi->tx_=
msg_lock, flags);
26de0ab9841a16 Jakob Koschel 2022-03-24  360  	list_for_each_entry_safe(ite=
r, temp, &ipmi->tx_msg_list, head) {
26de0ab9841a16 Jakob Koschel 2022-03-24 @361  		if (msg =3D=3D iter) {
26de0ab9841a16 Jakob Koschel 2022-03-24  362  			tx_msg =3D iter;
26de0ab9841a16 Jakob Koschel 2022-03-24  363  			list_del(&iter->head);
7b9844772237e3 Lv Zheng      2013-09-13  364  			break;
7b9844772237e3 Lv Zheng      2013-09-13  365  		}
e92b297cc72ade Zhao Yakui    2010-12-08  366  	}
5ac557ef4951ea Lv Zheng      2013-09-13  367  	spin_unlock_irqrestore(&ipmi=
->tx_msg_lock, flags);
7b9844772237e3 Lv Zheng      2013-09-13  368  =

26de0ab9841a16 Jakob Koschel 2022-03-24  369  	if (tx_msg)
7b9844772237e3 Lv Zheng      2013-09-13  370  		acpi_ipmi_msg_put(tx_msg);
e92b297cc72ade Zhao Yakui    2010-12-08  371  }
e92b297cc72ade Zhao Yakui    2010-12-08  372  =

e92b297cc72ade Zhao Yakui    2010-12-08  373  static void ipmi_msg_handler(=
struct ipmi_recv_msg *msg, void *user_msg_data)
e92b297cc72ade Zhao Yakui    2010-12-08  374  {
e92b297cc72ade Zhao Yakui    2010-12-08  375  	struct acpi_ipmi_device *ipm=
i_device =3D user_msg_data;
26de0ab9841a16 Jakob Koschel 2022-03-24  376  	struct acpi_ipmi_msg *tx_msg=
 =3D NULL, *iter, *temp;
2fb037b89a3125 Lv Zheng      2013-09-13  377  	struct device *dev =3D ipmi_=
device->dev;
06a8566bcf5cf7 Lv Zheng      2013-09-13  378  	unsigned long flags;
e92b297cc72ade Zhao Yakui    2010-12-08  379  =

e92b297cc72ade Zhao Yakui    2010-12-08  380  	if (msg->user !=3D ipmi_devi=
ce->user_interface) {
50065300314e95 Lv Zheng      2013-09-13  381  		dev_warn(dev,
50065300314e95 Lv Zheng      2013-09-13  382  			 "Unexpected response is r=
eturned. returned user %p, expected user %p\n",
e92b297cc72ade Zhao Yakui    2010-12-08  383  			 msg->user, ipmi_device->u=
ser_interface);
6b68f03f95e3f0 Lv Zheng      2013-09-13  384  		goto out_msg;
e92b297cc72ade Zhao Yakui    2010-12-08  385  	}
50065300314e95 Lv Zheng      2013-09-13  386  =

06a8566bcf5cf7 Lv Zheng      2013-09-13  387  	spin_lock_irqsave(&ipmi_devi=
ce->tx_msg_lock, flags);
26de0ab9841a16 Jakob Koschel 2022-03-24  388  	list_for_each_entry_safe(ite=
r, temp, &ipmi_device->tx_msg_list, head) {
26de0ab9841a16 Jakob Koschel 2022-03-24  389  		if (msg->msgid =3D=3D iter-=
>tx_msgid) {
26de0ab9841a16 Jakob Koschel 2022-03-24  390  			tx_msg =3D iter;
26de0ab9841a16 Jakob Koschel 2022-03-24  391  			list_del(&iter->head);
e92b297cc72ade Zhao Yakui    2010-12-08  392  			break;
e92b297cc72ade Zhao Yakui    2010-12-08  393  		}
e92b297cc72ade Zhao Yakui    2010-12-08  394  	}
7b9844772237e3 Lv Zheng      2013-09-13  395  	spin_unlock_irqrestore(&ipmi=
_device->tx_msg_lock, flags);
e92b297cc72ade Zhao Yakui    2010-12-08  396  =

26de0ab9841a16 Jakob Koschel 2022-03-24  397  	if (!tx_msg) {
50065300314e95 Lv Zheng      2013-09-13  398  		dev_warn(dev,
50065300314e95 Lv Zheng      2013-09-13  399  			 "Unexpected response (msg=
 id %ld) is returned.\n",
50065300314e95 Lv Zheng      2013-09-13  400  			 msg->msgid);
7b9844772237e3 Lv Zheng      2013-09-13  401  		goto out_msg;
e92b297cc72ade Zhao Yakui    2010-12-08  402  	}
e92b297cc72ade Zhao Yakui    2010-12-08  403  =

e92b297cc72ade Zhao Yakui    2010-12-08  404  	/* copy the response data to=
 Rx_data buffer */
6b68f03f95e3f0 Lv Zheng      2013-09-13  405  	if (msg->msg.data_len > ACPI=
_IPMI_MAX_MSG_LENGTH) {
2fb037b89a3125 Lv Zheng      2013-09-13  406  		dev_WARN_ONCE(dev, true,
6b68f03f95e3f0 Lv Zheng      2013-09-13  407  			      "Unexpected response=
 (msg len %d).\n",
6b68f03f95e3f0 Lv Zheng      2013-09-13  408  			      msg->msg.data_len);
8584ec6ae9cc38 Lv Zheng      2013-09-13  409  		goto out_comp;
8584ec6ae9cc38 Lv Zheng      2013-09-13  410  	}
50065300314e95 Lv Zheng      2013-09-13  411  =

8584ec6ae9cc38 Lv Zheng      2013-09-13  412  	/* response msg is an error =
msg */
8584ec6ae9cc38 Lv Zheng      2013-09-13  413  	msg->recv_type =3D IPMI_RESP=
ONSE_RECV_TYPE;
8584ec6ae9cc38 Lv Zheng      2013-09-13  414  	if (msg->recv_type =3D=3D IP=
MI_RESPONSE_RECV_TYPE &&
8584ec6ae9cc38 Lv Zheng      2013-09-13  415  	    msg->msg.data_len =3D=3D=
 1) {
8584ec6ae9cc38 Lv Zheng      2013-09-13  416  		if (msg->msg.data[0] =3D=3D=
 IPMI_TIMEOUT_COMPLETION_CODE) {
f513561455c31f Sinan Kaya    2017-03-23  417  			dev_dbg_once(dev, "Unexpec=
ted response (timeout).\n");
8584ec6ae9cc38 Lv Zheng      2013-09-13  418  			tx_msg->msg_done =3D ACPI_=
IPMI_TIMEOUT;
8584ec6ae9cc38 Lv Zheng      2013-09-13  419  		}
8584ec6ae9cc38 Lv Zheng      2013-09-13  420  		goto out_comp;
8584ec6ae9cc38 Lv Zheng      2013-09-13  421  	}
50065300314e95 Lv Zheng      2013-09-13  422  =

e92b297cc72ade Zhao Yakui    2010-12-08  423  	tx_msg->rx_len =3D msg->msg.=
data_len;
6b68f03f95e3f0 Lv Zheng      2013-09-13  424  	memcpy(tx_msg->data, msg->ms=
g.data, tx_msg->rx_len);
8584ec6ae9cc38 Lv Zheng      2013-09-13  425  	tx_msg->msg_done =3D ACPI_IP=
MI_OK;
50065300314e95 Lv Zheng      2013-09-13  426  =

8584ec6ae9cc38 Lv Zheng      2013-09-13  427  out_comp:
e92b297cc72ade Zhao Yakui    2010-12-08  428  	complete(&tx_msg->tx_complet=
e);
7b9844772237e3 Lv Zheng      2013-09-13  429  	acpi_ipmi_msg_put(tx_msg);
6b68f03f95e3f0 Lv Zheng      2013-09-13  430  out_msg:
e92b297cc72ade Zhao Yakui    2010-12-08  431  	ipmi_free_recv_msg(msg);
50065300314e95 Lv Zheng      2013-09-13  432  }
e92b297cc72ade Zhao Yakui    2010-12-08  433  =

e92b297cc72ade Zhao Yakui    2010-12-08  434  static void ipmi_register_bmc=
(int iface, struct device *dev)
e92b297cc72ade Zhao Yakui    2010-12-08  435  {
e92b297cc72ade Zhao Yakui    2010-12-08  436  	struct acpi_ipmi_device *ipm=
i_device, *temp;
e92b297cc72ade Zhao Yakui    2010-12-08  437  	int err;
e92b297cc72ade Zhao Yakui    2010-12-08  438  	struct ipmi_smi_info smi_dat=
a;
e92b297cc72ade Zhao Yakui    2010-12-08  439  	acpi_handle handle;
e92b297cc72ade Zhao Yakui    2010-12-08  440  =

e92b297cc72ade Zhao Yakui    2010-12-08  441  	err =3D ipmi_get_smi_info(if=
ace, &smi_data);
e92b297cc72ade Zhao Yakui    2010-12-08  442  	if (err)
e92b297cc72ade Zhao Yakui    2010-12-08  443  		return;
e92b297cc72ade Zhao Yakui    2010-12-08  444  =

a1a69b297e4775 Lv Zheng      2013-09-13  445  	if (smi_data.addr_src !=3D S=
I_ACPI)
a1a69b297e4775 Lv Zheng      2013-09-13  446  		goto err_ref;
e92b297cc72ade Zhao Yakui    2010-12-08  447  	handle =3D smi_data.addr_inf=
o.acpi_info.acpi_handle;
a1a69b297e4775 Lv Zheng      2013-09-13  448  	if (!handle)
a1a69b297e4775 Lv Zheng      2013-09-13  449  		goto err_ref;
a1a69b297e4775 Lv Zheng      2013-09-13  450  =

2fb037b89a3125 Lv Zheng      2013-09-13  451  	ipmi_device =3D ipmi_dev_all=
oc(iface, smi_data.dev, handle);
a1a69b297e4775 Lv Zheng      2013-09-13  452  	if (!ipmi_device) {
2fb037b89a3125 Lv Zheng      2013-09-13  453  		dev_warn(smi_data.dev, "Can=
't create IPMI user interface\n");
a1a69b297e4775 Lv Zheng      2013-09-13  454  		goto err_ref;
a1a69b297e4775 Lv Zheng      2013-09-13  455  	}
e92b297cc72ade Zhao Yakui    2010-12-08  456  =

e92b297cc72ade Zhao Yakui    2010-12-08  457  	mutex_lock(&driver_data.ipmi=
_lock);
e92b297cc72ade Zhao Yakui    2010-12-08  458  	list_for_each_entry(temp, &d=
river_data.ipmi_devices, head) {
e92b297cc72ade Zhao Yakui    2010-12-08  459  		/*
e92b297cc72ade Zhao Yakui    2010-12-08  460  		 * if the corresponding ACP=
I handle is already added
e92b297cc72ade Zhao Yakui    2010-12-08  461  		 * to the device list, don'=
t add it again.
e92b297cc72ade Zhao Yakui    2010-12-08  462  		 */
e92b297cc72ade Zhao Yakui    2010-12-08  463  		if (temp->handle =3D=3D han=
dle)
a1a69b297e4775 Lv Zheng      2013-09-13  464  			goto err_lock;
e92b297cc72ade Zhao Yakui    2010-12-08  465  	}
e96a94edd7ae30 Lv Zheng      2013-09-13  466  	if (!driver_data.selected_sm=
i)
e96a94edd7ae30 Lv Zheng      2013-09-13  467  		driver_data.selected_smi =
=3D ipmi_device;
a1a69b297e4775 Lv Zheng      2013-09-13  468  	list_add_tail(&ipmi_device->=
head, &driver_data.ipmi_devices);
e92b297cc72ade Zhao Yakui    2010-12-08  469  	mutex_unlock(&driver_data.ip=
mi_lock);
50065300314e95 Lv Zheng      2013-09-13  470  =

a1a69b297e4775 Lv Zheng      2013-09-13  471  	put_device(smi_data.dev);
e92b297cc72ade Zhao Yakui    2010-12-08  472  	return;
e92b297cc72ade Zhao Yakui    2010-12-08  473  =

a1a69b297e4775 Lv Zheng      2013-09-13  474  err_lock:
e92b297cc72ade Zhao Yakui    2010-12-08  475  	mutex_unlock(&driver_data.ip=
mi_lock);
a1a69b297e4775 Lv Zheng      2013-09-13  476  	ipmi_dev_release(ipmi_device=
);
a1a69b297e4775 Lv Zheng      2013-09-13  477  err_ref:
e92b297cc72ade Zhao Yakui    2010-12-08  478  	put_device(smi_data.dev);
e92b297cc72ade Zhao Yakui    2010-12-08  479  }
e92b297cc72ade Zhao Yakui    2010-12-08  480  =

e92b297cc72ade Zhao Yakui    2010-12-08  481  static void ipmi_bmc_gone(int=
 iface)
e92b297cc72ade Zhao Yakui    2010-12-08  482  {
26de0ab9841a16 Jakob Koschel 2022-03-24  483  	struct acpi_ipmi_device *ipm=
i_device =3D NULL, *iter, *temp;
e92b297cc72ade Zhao Yakui    2010-12-08  484  =

e92b297cc72ade Zhao Yakui    2010-12-08  485  	mutex_lock(&driver_data.ipmi=
_lock);
26de0ab9841a16 Jakob Koschel 2022-03-24  486  	list_for_each_entry_safe(ite=
r, temp,
e92b297cc72ade Zhao Yakui    2010-12-08  487  				 &driver_data.ipmi_device=
s, head) {
26de0ab9841a16 Jakob Koschel 2022-03-24 @488  		if (iter->ipmi_ifnum !=3D i=
face) {
26de0ab9841a16 Jakob Koschel 2022-03-24  489  			ipmi_device =3D iter;
26de0ab9841a16 Jakob Koschel 2022-03-24  490  			__ipmi_dev_kill(iter);
e92b297cc72ade Zhao Yakui    2010-12-08  491  			break;
e92b297cc72ade Zhao Yakui    2010-12-08  492  		}
a1a69b297e4775 Lv Zheng      2013-09-13  493  	}
e96a94edd7ae30 Lv Zheng      2013-09-13  494  	if (!driver_data.selected_sm=
i)
e96a94edd7ae30 Lv Zheng      2013-09-13  495  		driver_data.selected_smi =
=3D list_first_entry_or_null(
e96a94edd7ae30 Lv Zheng      2013-09-13  496  					&driver_data.ipmi_device=
s,
e96a94edd7ae30 Lv Zheng      2013-09-13  497  					struct acpi_ipmi_device,=
 head);
e92b297cc72ade Zhao Yakui    2010-12-08  498  	mutex_unlock(&driver_data.ip=
mi_lock);
50065300314e95 Lv Zheng      2013-09-13  499  =

26de0ab9841a16 Jakob Koschel 2022-03-24  500  	if (ipmi_device) {
a1a69b297e4775 Lv Zheng      2013-09-13  501  		ipmi_flush_tx_msg(ipmi_devi=
ce);
a1a69b297e4775 Lv Zheng      2013-09-13  502  		acpi_ipmi_dev_put(ipmi_devi=
ce);
a1a69b297e4775 Lv Zheng      2013-09-13  503  	}
e92b297cc72ade Zhao Yakui    2010-12-08  504  }
50065300314e95 Lv Zheng      2013-09-13  505  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5901817891318505895==--

