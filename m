Content-Type: multipart/mixed; boundary="===============8173019559694238917=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [RFC PATCH freescale-fslc] MLK-24962 net: wireless: nxp: mxm_wifiex: wlan_disable_pcie_host_int() can be static
Date: Tue, 28 Sep 2021 14:06:05 +0800
Message-ID: <20210928060605.GA45211@04eac9d2ae97>
In-Reply-To: <202109281432.TDPaxUjO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8173019559694238917==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Otavio Salvador <otavio@ossystems.com.br>

drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:548:13: warni=
ng: symbol 'wlan_disable_pcie_host_int' was not declared. Should it be stat=
ic?
drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:581:13: warni=
ng: symbol 'wlan_clear_pending_int_status' was not declared. Should it be s=
tatic?
drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:624:13: warni=
ng: symbol 'wlan_enable_pcie_host_int' was not declared. Should it be stati=
c?
drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2428:13: warn=
ing: symbol 'wlan_pcie_cmdrsp_complete' was not declared. Should it be stat=
ic?
drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2648:13: warn=
ing: symbol 'wlan_pcie_event_complete' was not declared. Should it be stati=
c?
drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:126:1=
3: warning: symbol 'wlan_cmd_set_get_beacon_stuck_cfg' was not declared. Sh=
ould it be static?
drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:157:1=
3: warning: symbol 'wlan_ret_set_get_beacon_stuck_cfg' was not declared. Sh=
ould it be static?
drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:14548:=
5: warning: symbol 'woal_priv_arbcfg' was not declared. Should it be static?
drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:292=
1:6: warning: symbol 'woal_cfg80211_fill_rate_info' was not declared. Shoul=
d it be static?
drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:394:5: warn=
ing: symbol 'woal_pcie_probe' was not declared. Should it be static?
drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:896:13: war=
ning: symbol 'woal_pcie_write_data_sync' was not declared. Should it be sta=
tic?
drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:912:13: war=
ning: symbol 'woal_pcie_read_data_sync' was not declared. Should it be stat=
ic?
drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:1418:5: war=
ning: symbol 'woal_pcie_dump_reg_info' was not declared. Should it be stati=
c?
drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:1736:21: wa=
rning: symbol 'mem_type_mapping_tbl_8997' was not declared. Should it be st=
atic?
drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:1752:13: wa=
rning: symbol 'woal_read_reg_eight_bit' was not declared. Should it be stat=
ic?
drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:1767:13: wa=
rning: symbol 'woal_pcie_rdwr_firmware' was not declared. Should it be stat=
ic?
drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:2013:6: war=
ning: symbol 'woal_pcie_dump_fw_info_v2' was not declared. Should it be sta=
tic?
drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:2192:6: war=
ning: symbol 'woal_pcie_dump_fw_info' was not declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c           | =
  14 +++---
 drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c   | =
  14 +++---
 drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c    | =
   2 =

 drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c         | =
  22 +++++-----
 drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c | =
   4 -
 5 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c =
b/drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c
index 04cd3f4034224..fea174c4421db 100644
--- a/drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c
+++ b/drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c
@@ -545,7 +545,7 @@ wlan_pcie_enable_host_int_status_mask(mlan_adapter *pma=
dapter, t_u8 enable)
  *
  *  @return        MLAN_STATUS_SUCCESS or MLAN_STATUS_FAILURE
  */
-mlan_status wlan_disable_pcie_host_int(mlan_adapter *pmadapter)
+static mlan_status wlan_disable_pcie_host_int(mlan_adapter *pmadapter)
 {
 	mlan_status ret;
 =

@@ -578,7 +578,7 @@ mlan_status wlan_disable_pcie_host_int(mlan_adapter *pm=
adapter)
  *
  *  @return             MLAN_STATUS_SUCCESS or MLAN_STATUS_FAILURE
  */
-mlan_status wlan_clear_pending_int_status(mlan_adapter *pmadapter)
+static mlan_status wlan_clear_pending_int_status(mlan_adapter *pmadapter)
 {
 	mlan_status ret =3D MLAN_STATUS_SUCCESS;
 	t_u32 pcie_ireg =3D 0;
@@ -621,7 +621,7 @@ mlan_status wlan_clear_pending_int_status(mlan_adapter =
*pmadapter)
  *
  *  @return        MLAN_STATUS_SUCCESS or MLAN_STATUS_FAILURE
  */
-mlan_status wlan_enable_pcie_host_int(mlan_adapter *pmadapter)
+static mlan_status wlan_enable_pcie_host_int(mlan_adapter *pmadapter)
 {
 	mlan_status ret;
 =

@@ -2425,8 +2425,8 @@ static mlan_status wlan_pcie_process_cmd_resp(mlan_ad=
apter *pmadapter)
  *
  *  @return 	        MLAN_STATUS_SUCCESS or MLAN_STATUS_FAILURE
  */
-mlan_status wlan_pcie_cmdrsp_complete(mlan_adapter *pmadapter,
-				      mlan_buffer *pmbuf, mlan_status status)
+static mlan_status wlan_pcie_cmdrsp_complete(mlan_adapter *pmadapter,
+					     mlan_buffer *pmbuf, mlan_status status)
 {
 	mlan_buffer *pcmdmbuf;
 	pmlan_callbacks pcb =3D &pmadapter->callbacks;
@@ -2645,8 +2645,8 @@ static mlan_status wlan_pcie_process_event_ready(mlan=
_adapter *pmadapter)
  *
  *  @return 	        MLAN_STATUS_SUCCESS or MLAN_STATUS_FAILURE
  */
-mlan_status wlan_pcie_event_complete(mlan_adapter *pmadapter,
-				     mlan_buffer *pmbuf, mlan_status status)
+static mlan_status wlan_pcie_event_complete(mlan_adapter *pmadapter,
+					    mlan_buffer *pmbuf, mlan_status status)
 {
 	mlan_status ret =3D MLAN_STATUS_SUCCESS;
 	pmlan_callbacks pcb =3D &pmadapter->callbacks;
diff --git a/drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmd=
event.c b/drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdeve=
nt.c
index 45ea63030b9b4..31ac52f5f6c93 100644
--- a/drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c
+++ b/drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c
@@ -123,10 +123,10 @@ mlan_status wlan_ret_set_get_band_steering_cfg(mlan_p=
rivate *pmpriv,
  *  @param pdata_buf    A pointer to data buffer
  *  @return             MLAN_STATUS_SUCCESS or MLAN_STATUS_FAILURE
  */
-mlan_status wlan_cmd_set_get_beacon_stuck_cfg(IN pmlan_private pmpriv,
-					      IN HostCmd_DS_COMMAND *cmd,
-					      IN t_u16 cmd_action,
-					      IN t_void *pdata_buf)
+static mlan_status wlan_cmd_set_get_beacon_stuck_cfg(IN pmlan_private pmpr=
iv,
+						     IN HostCmd_DS_COMMAND *cmd,
+						     IN t_u16 cmd_action,
+						     IN t_void *pdata_buf)
 {
 	HostCmd_DS_BEACON_STUCK_CFG *pbeacon_stuck_param_cfg =3D
 		(HostCmd_DS_BEACON_STUCK_CFG *)(pdata_buf + sizeof(t_u32));
@@ -154,9 +154,9 @@ mlan_status wlan_cmd_set_get_beacon_stuck_cfg(IN pmlan_=
private pmpriv,
  *
  *  @return             MLAN_STATUS_SUCCESS or MLAN_STATUS_FAILURE
  */
-mlan_status wlan_ret_set_get_beacon_stuck_cfg(mlan_private *pmpriv,
-					      HostCmd_DS_COMMAND *resp,
-					      mlan_ioctl_req *pioctl_buf)
+static mlan_status wlan_ret_set_get_beacon_stuck_cfg(mlan_private *pmpriv,
+						     HostCmd_DS_COMMAND *resp,
+						     mlan_ioctl_req *pioctl_buf)
 {
 	mlan_status ret =3D MLAN_STATUS_SUCCESS;
 	HostCmd_DS_BEACON_STUCK_CFG *pbeacon_stuck_param_cfg =3D
diff --git a/drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_i=
octl.c b/drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl=
.c
index a677688142f27..1d37fb788349c 100644
--- a/drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c
+++ b/drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c
@@ -14545,7 +14545,7 @@ static int woal_priv_set_get_lpm(moal_private *priv=
, t_u8 *respbuf,
  *
  *  @return             Number of bytes written, negative for failure.
  */
-int woal_priv_arbcfg(moal_private *priv, t_u8 *respbuf, t_u32 respbuflen)
+static int woal_priv_arbcfg(moal_private *priv, t_u8 *respbuf, t_u32 respb=
uflen)
 {
 	mlan_ioctl_req *req =3D NULL;
 	mlan_ds_misc_cfg *misc =3D NULL;
diff --git a/drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.=
c b/drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c
index f61c3fa327de1..b36ec31592483 100644
--- a/drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c
+++ b/drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c
@@ -391,7 +391,7 @@ mlan_status woal_do_flr(moal_handle *handle, bool prepa=
re)
  *
  *  @return         error code
  */
-int woal_pcie_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+static int woal_pcie_probe(struct pci_dev *pdev, const struct pci_device_i=
d *id)
 {
 	pcie_service_card *card =3D NULL;
 	t_u16 card_type =3D 0;
@@ -893,8 +893,8 @@ static mlan_status woal_pcie_read_reg(moal_handle *hand=
le, t_u32 reg,
  *
  *  @return    		MLAN_STATUS_SUCCESS or MLAN_STATUS_FAILURE
  */
-mlan_status woal_pcie_write_data_sync(moal_handle *handle, mlan_buffer *pm=
buf,
-				      t_u32 port, t_u32 timeout)
+static mlan_status woal_pcie_write_data_sync(moal_handle *handle, mlan_buf=
fer *pmbuf,
+					     t_u32 port, t_u32 timeout)
 {
 	return MLAN_STATUS_SUCCESS;
 }
@@ -909,8 +909,8 @@ mlan_status woal_pcie_write_data_sync(moal_handle *hand=
le, mlan_buffer *pmbuf,
  *
  *  @return    		MLAN_STATUS_SUCCESS or MLAN_STATUS_FAILURE
  */
-mlan_status woal_pcie_read_data_sync(moal_handle *handle, mlan_buffer *pmb=
uf,
-				     t_u32 port, t_u32 timeout)
+static mlan_status woal_pcie_read_data_sync(moal_handle *handle, mlan_buff=
er *pmbuf,
+					    t_u32 port, t_u32 timeout)
 {
 	return MLAN_STATUS_SUCCESS;
 }
@@ -1415,7 +1415,7 @@ void woal_pcie_bus_unregister(void)
  *
  *  @return         The length of this log
  */
-int woal_pcie_dump_reg_info(moal_handle *phandle, t_u8 *buffer)
+static int woal_pcie_dump_reg_info(moal_handle *phandle, t_u8 *buffer)
 {
 	char *drv_ptr =3D (char *)buffer;
 	t_u32 reg =3D 0, value =3D 0;
@@ -1733,7 +1733,7 @@ memory_type_mapping mem_type_mapping_tbl_8897[] =3D {
 #if defined(PCIE8997) || defined(PCIE9098) || defined(PCIE9097)
 #define DEBUG_HOST_READY_8997 0xCC
 #define DEBUG_MEMDUMP_FINISH_8997 0xDD
-memory_type_mapping mem_type_mapping_tbl_8997 =3D {"DUMP", NULL, NULL, 0xD=
D,
+static memory_type_mapping mem_type_mapping_tbl_8997 =3D {"DUMP", NULL, NU=
LL, 0xDD,
 						 0x00};
 =

 #endif
@@ -1749,7 +1749,7 @@ memory_type_mapping mem_type_mapping_tbl_8997 =3D {"D=
UMP", NULL, NULL, 0xDD,
  *
  *  @return    		MLAN_STATUS_SUCCESS or MLAN_STATUS_FAILURE
  */
-mlan_status woal_read_reg_eight_bit(moal_handle *handle, t_u32 reg, t_u8 *=
data)
+static mlan_status woal_read_reg_eight_bit(moal_handle *handle, t_u32 reg,=
 t_u8 *data)
 {
 	pcie_service_card *card =3D (pcie_service_card *)handle->card;
 	*data =3D ioread8(card->pci_mmap1 + reg);
@@ -1764,7 +1764,7 @@ mlan_status woal_read_reg_eight_bit(moal_handle *hand=
le, t_u32 reg, t_u8 *data)
  *
  *  @return         MLAN_STATUS_SUCCESS
  */
-rdwr_status woal_pcie_rdwr_firmware(moal_handle *phandle, t_u8 doneflag)
+static rdwr_status woal_pcie_rdwr_firmware(moal_handle *phandle, t_u8 done=
flag)
 {
 	int ret =3D 0;
 	int tries =3D 0;
@@ -2010,7 +2010,7 @@ void woal_pcie_dump_fw_info_v1(moal_handle *phandle)
  *
  *  @return         N/A
  */
-void woal_pcie_dump_fw_info_v2(moal_handle *phandle)
+static void woal_pcie_dump_fw_info_v2(moal_handle *phandle)
 {
 	int ret =3D 0;
 	unsigned int reg, reg_start, reg_end;
@@ -2189,7 +2189,7 @@ static t_u8 woal_pcie_is_second_mac(moal_handle *hand=
le)
 	return MFALSE;
 }
 =

-void woal_pcie_dump_fw_info(moal_handle *phandle)
+static void woal_pcie_dump_fw_info(moal_handle *phandle)
 {
 	mlan_pm_wakeup_card(phandle->pmlan_adapter, MTRUE);
 	phandle->fw_dump =3D MTRUE;
diff --git a/drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_c=
fg80211.c b/drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cf=
g80211.c
index 98f71fa5b0523..44673b0e13fb8 100644
--- a/drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211=
.c
+++ b/drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211=
.c
@@ -2918,8 +2918,8 @@ int woal_cfg80211_assoc(moal_private *priv, void *sme=
, t_u8 wait_option,
  *
  * @return                0 -- success, otherwise fail
  */
-void woal_cfg80211_fill_rate_info(moal_private *priv,
-				  struct station_info *sinfo)
+static void woal_cfg80211_fill_rate_info(moal_private *priv,
+					 struct station_info *sinfo)
 {
 	mlan_status ret =3D MLAN_STATUS_SUCCESS;
 	mlan_ioctl_req *req =3D NULL;
diff --git a/scripts/spdxcheck-test.sh b/scripts/spdxcheck-test.sh
old mode 100644
new mode 100755
diff --git a/scripts/xen-hypercalls.sh b/scripts/xen-hypercalls.sh
old mode 100644
new mode 100755
--===============8173019559694238917==--

