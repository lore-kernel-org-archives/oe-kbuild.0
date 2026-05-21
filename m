Received: from arkamax.eu (128-116-240-228.dyn.eolo.it [128.116.240.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0F9343D72;
	Thu, 21 May 2026 08:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.116.240.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779351681; cv=none; b=S3dPsJ8LE1Q5odGuPDHiKak6IxtloHkLuVeIAT+HK4BI6BbgT0eEZ1Qp7hYa55WvAUtrdfT/128FucRkRx4KRCazRHeN8f1srce7xw37/yZw8DYswI2iRHV1NLMpnJuL7Bd45GQBXGOkfOKsth8u+vgMQ1scK5YGg1v+0Q9JV/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779351681; c=relaxed/simple;
	bh=LN8yczJ029O8X7FHUx6MRYDruR6im3IXWxqpcWorUSY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=eASS4i2bScnDsQ94iqIIfw/jssccYnNaZSNo8qCre2+Oc7/aw71F3niUQmBDP64qO/RzcVL7x/qDkGvvI3mVP8k0mpJl3oi8NVfnxhNHUc7wIGMSK1kBpGKV/KbwVxAvg3ukC0yhaO0IXMElbHR/Te50V38mbzl7pCkcsGKIY44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arkamax.eu; spf=pass smtp.mailfrom=arkamax.eu; dkim=pass (2048-bit key) header.d=arkamax.eu header.i=@arkamax.eu header.b=BGN/jxcK; arc=none smtp.client-ip=128.116.240.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arkamax.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arkamax.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arkamax.eu header.i=@arkamax.eu header.b="BGN/jxcK"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=mail1; bh=LN8yczJ029O8X7
	FHUx6MRYDruR6im3IXWxqpcWorUSY=; h=in-reply-to:references:to:from:
	subject:cc:date; d=arkamax.eu; b=BGN/jxcK4fr2xWsTLi8q96cjbBfzm6f3QFuCT
	TZ2001h1n9YnINhdS54oV6cNLLm9mGwl+fRj0uCgGc6N8jjWfdUjw8ZEAOiV0MtHN4Ed4R
	ly3KncM8ZJkI39/82+AitQCgFWKOsNixEG6xMWTaAFCGu7Wrs1mH0t4XUJ+Az7r3/WYArZ
	ZpyCrC8oyJtEnUHQzZD63w7IL2aGbDSWmlHIN3LgGC3RSw6XevCpEIEvLlGgqmnDRPjW0y
	jgYiLyASmNg5iBBYt4t5gxuWdZqG/69NRaH6OvZ51pymPTKe3jV+zvBU8BXZ25C2jxkyRs
	oNlgRHtzACfJ/JRSfhbhJwZUw==
Received: from localhost (128-116-240-228.dyn.eolo.it [128.116.240.228])
	by arkamax.eu (OpenSMTPD) with ESMTPSA id b7339feb (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 21 May 2026 10:21:16 +0200 (CEST)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 21 May 2026 10:21:16 +0200
Message-Id: <DIO7IZM19TG0.1CE7QBX3MTANV@arkamax.eu>
Cc: <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
 <linux-nvme@lists.infradead.org>, "Keith Busch" <kbusch@kernel.org>,
 "Daniel Wagner" <dwagner@suse.de>, "Mohamed Khalfella"
 <mkhalfella@purestorage.com>, "Hannes Reinecke" <hare@kernel.org>,
 "Christoph Hellwig" <hch@lst.de>
Subject: Re: [linux-nvme:nvme-7.2 2/7] drivers/nvme/host/core.c:5259
 nvme_wait_freeze_timeout() warn: 'timeout' unsigned <= 0
From: "Maurizio Lombardi" <mlombard@arkamax.eu>
To: "Dan Carpenter" <error27@gmail.com>, <oe-kbuild@lists.linux.dev>,
 "Maurizio Lombardi" <mlombard@redhat.com>
X-Mailer: aerc 0.21.0
References: <202605211257.STzj2Ujv-lkp@intel.com>
In-Reply-To: <202605211257.STzj2Ujv-lkp@intel.com>

On Thu May 21, 2026 at 8:43 AM CEST, Dan Carpenter wrote:
> tree:   git://git.infradead.org/nvme.git nvme-7.2
> head:   00d7b33351aac0ea55d17167561e12bbeca73138
> commit: 23b6d2cbf75ff15647efbb7c0e5c03bd7ed1fe1a [2/7] nvme: remove redun=
dant timeout argument from nvme_wait_freeze_timeout
> config: s390-randconfig-r073-20260521 (https://download.01.org/0day-ci/ar=
chive/20260521/202605211257.STzj2Ujv-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b=
5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> smatch: v0.5.0-9185-gbcc58b9c
>
>
> 302ad8cc09339ea Keith Busch       2017-03-01  5260  			break;
> 302ad8cc09339ea Keith Busch       2017-03-01  5261  	}
> be647e2c76b27f4 Keith Busch       2024-05-21  5262  	srcu_read_unlock(&ct=
rl->srcu, srcu_idx);
> 7cf0d7c0f3c3b02 Sagi Grimberg     2020-07-30  5263  	return timeout;
>
> This returns is nonsense.  ;)  >=3D 1 on success or empty.  0 on timeout.

What about 0 on success, -ETIMEDOUT on timeout?

nvme: standardize nvme_wait_freeze_timeout return value

Currently, nvme_wait_freeze_timeout() returns the remaining timeout
value (in jiffies) on success, and 0 on timeout.

Update the function to follow standard kernel conventions by returning
0 on success and -ETIMEDOUT on failure.

Signed-off-by: Maurizio Lombardi <mlombard@redhat.com>
---
 drivers/nvme/host/core.c | 7 +++++--
 drivers/nvme/host/rdma.c | 2 +-
 drivers/nvme/host/tcp.c  | 2 +-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 26a65404279f..85d94d3b6a28 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -5249,16 +5249,19 @@ int nvme_wait_freeze_timeout(struct nvme_ctrl *ctrl=
)
 	unsigned long timeout =3D ctrl->io_timeout;
 	struct nvme_ns *ns;
 	int srcu_idx;
+	int ret =3D 0;

 	srcu_idx =3D srcu_read_lock(&ctrl->srcu);
 	list_for_each_entry_srcu(ns, &ctrl->namespaces, list,
 				 srcu_read_lock_held(&ctrl->srcu)) {
 		timeout =3D blk_mq_freeze_queue_wait_timeout(ns->queue, timeout);
-		if (!timeout)
+		if (!timeout) {
+			ret =3D -ETIMEDOUT;
 			break;
+		}
 	}
 	srcu_read_unlock(&ctrl->srcu, srcu_idx);
-	return timeout;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(nvme_wait_freeze_timeout);

diff --git a/drivers/nvme/host/rdma.c b/drivers/nvme/host/rdma.c
index bf73135c1439..3ac0a7e390e1 100644
--- a/drivers/nvme/host/rdma.c
+++ b/drivers/nvme/host/rdma.c
@@ -888,7 +888,7 @@ static int nvme_rdma_configure_io_queues(struct nvme_rd=
ma_ctrl *ctrl, bool new)
 	if (!new) {
 		nvme_start_freeze(&ctrl->ctrl);
 		nvme_unquiesce_io_queues(&ctrl->ctrl);
-		if (!nvme_wait_freeze_timeout(&ctrl->ctrl)) {
+		if (nvme_wait_freeze_timeout(&ctrl->ctrl)) {
 			/*
 			 * If we timed out waiting for freeze we are likely to
 			 * be stuck.  Fail the controller initialization just
diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 0552aa8a1150..52bd4478181e 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -2208,7 +2208,7 @@ static int nvme_tcp_configure_io_queues(struct nvme_c=
trl *ctrl, bool new)
 	if (!new) {
 		nvme_start_freeze(ctrl);
 		nvme_unquiesce_io_queues(ctrl);
-		if (!nvme_wait_freeze_timeout(ctrl)) {
+		if (nvme_wait_freeze_timeout(ctrl)) {
 			/*
 			 * If we timed out waiting for freeze we are likely to
 			 * be stuck.  Fail the controller initialization just
--
2.54.0


Maurizio
