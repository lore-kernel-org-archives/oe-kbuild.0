Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795761055;
	b=oF2I7kaD2OfvDtrUbmKBBndmJpVYJHPYSeU0wIiQdCS3wONXMDcqdXLY+FY5YuKNUzUn
	 FVzBVuwWWv/l8fdrzeEdGihSM7FAQEtzHaoSROIhc7pofe4PgYbNVIlBQsxy6svRMXqlw
	 PXM0guZBKiaJLyoPeR+0taodGx0IPrj0Qdxzefu1v3ewlqdkdtJjkaniYRsjMSm8S8i+o
	 N2Mw5zDreLNxCUuvbaqQcTMKl8JBZbzdShMSwkb5oshknYdltVQ7/yQaJIZXmNGdyHikL
	 T3iYBRhriyN79CpTmuJ+aERW5MJQpnMCQP7+NUsfGu2BrAlIF1tvkauT51YUh8X0W+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Rt1XOGSiV3B8gaRu1VnsEFJwnqhYcs1CBCTj3ZEiQzA=;
	b=5OSjcFB8KJ3+KKBYr4FPsAWQhHondgHdL1DiJkNc8oHFn4rNhW8cn4G10Rb8+l3TCQdW
	 GgkBJziCEWw78qUJzajluzEkHFPtCwpuQJoIMTyyuZWp1drwEVH732mpL7VDJYaI9KLWr
	 yR270QVnJ1Cp7t6lBuT2QeltBUZ/AHlhMnlmj9saRf3H+mEbyA37v/0wiTRl26R3Q3Y3L
	 23fMgNF7tdfCt0o3Q5gZvTXCWt7Mo+FvahN8rfp+0E14Wtw6exQxwvJLdHo38JFpSiSVi
	 sKRktBNNYf1A7Kc/DTErLcf4oUUeBURlQ9hElN6eG8o4Exx8ZciXMb0jhHyAvEkMueA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=LOS97JD1;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A95606A31E
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Nov 2026 06:30:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48A95606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=LOS97JD1
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so76118575e9.1
        for <oe-kbuild@lists.linux.dev>; Thu, 26 Nov 2026 22:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795761054; x=1796365854; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rt1XOGSiV3B8gaRu1VnsEFJwnqhYcs1CBCTj3ZEiQzA=;
        b=LOS97JD1qhBcl8RXw0FX/ZoeQVbVT/PiBatfBrd+RikWv/QypQyHphGt0o8SOtrDBf
         sVJFvfF50nvxvEKfOCjW+077pW/1Vwn4V4EZXlxyTLg7/bdZkLchLem0fD2GynPesLfR
         Q10klgRF9ipbV0tsdHxvr3yHB/XQLUR/c5BP930Ny1x/IWhQrdWu5UNbCzpZJMXhf+qR
         ioqu/S+6eZsWp/bpS9oo8X5r3ZYlpWRLppjxlTKoUI7SD2p0tOEy7g/Ke8sHPoX8n9RV
         4+2ja+8F/iVtMMGBwI+PobyAZ+mq8IQg0rJ2lay7mG59DHHLGVMhIwOb8l5WeBdnMK9y
         2KQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795761054; x=1796365854;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rt1XOGSiV3B8gaRu1VnsEFJwnqhYcs1CBCTj3ZEiQzA=;
        b=iW+QET3GC+SZxHDVtAy1WDfJnbLB2TXskcbthEU/rqCP6487PCafSDSXqzPLpx+rir
         h8Tk2NxfgGzDGYbI/UOcUD6gxCeCh+C7SJnR/7Lr9EMFR4WObFGMwEbYnN3/0sr0Zlb5
         ntmXQybbo006w0DMgw06RDwZjXuv0Est2tvjDPWkBDFZxvol+JOoTx2rQ/LqKSmnlOLC
         LjwKdR6QH+w1YAQsgfUKZqqG6ZBZOxFwvSzkXEJJnI8aUd20aJDnxwxqMh9DZUbTNVuz
         q8Ajgl7r2d3FLduxhhqjMiOaHjiEoqRRv4GA+ucdBYqc83Xp4slaeLIIbBVIDL6qszD8
         GV2A==
X-Forwarded-Encrypted: i=1; AL+hErG8zARBMYHuvC9FoThZo2IBthY27N3n/v9+Rd2JR0UdV+AQ2k5qrVjYC3JSs84zQmkd7keoZp2Vt/o=@lists.linux.dev
X-Gm-Message-State: APuU4Z/lR+WYFf31nUpJXi6md1F3AtVW6SqA/WCW/TbHS/zPamfmlTYv
	EKXYW7ozqdaG5lwO+mqsVEHg7lmzfdutWOEVJ/zgNtU/RWkfLDTlBm12Q3dPL3qEEm0=
X-Gm-Gg: AZFdTZfjVmMr6Ok4X6/CytR4Mv785bjRH8OP1ZKNexSujj6lTwHS1hEQ6eizDIuHGKA
	da35RuUeesVn02TYFpA8OPz3aa8Eb50UbO4cCDOs7M7jjR7WEM3wN6ha+OdGernrK5AWrw1Qzrc
	8oYATgpY/6NeJV2m43E1LVab8cnRrBfW48bSuTrwnpNcAN4SijOsRbR6FuiLPtTZ+TmaigCQ5Y0
	l6WfXOpkx3uFAyTa/lTcX3lQOEGCoo7w7NwT/eNFsP/myC+FThx/A7aHFUl/+gXZJybuYI7LTrV
	2pbeUJv+TNtaA9gYPNvsuvGhnOVzGBa6Cw68N0CLtpHY+dauSBndmQhkKIbhaW65r1UEKIC9bRm
	YzGZ6p+HU0N59K3fcK23eEzWdI9Uo9LpYI2eP/ud2EoKF69k4w/rfj0PLODYQX+XeAA1XCBByF+
	OqhH5D0vrhr19FI/YozmcoKaNXc+E2EFeOa0yaEC8O3W+26hB2QDKRA+VeGVXbUsUQITBBwuvzR
	GMKL8E9Esi5FYmDF4vhl9jaIw0LMr0jARdGpbq0RKSh17B1R6uNNr+GLCekVEIhmfuObG5aHvJq
	PrWJM/XZoFDHDXemx3wf
X-Received: by 2002:a05:600c:1993:b0:4bb:8711:fcb9 with SMTP id 5b1f17b1804b1-4bb88941bcemr437830755e9.33.1795761053369;
        Thu, 26 Nov 2026 22:30:53 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm695486945e9.2.2026.11.26.22.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:30:52 -0800 (PST)
Date: Fri, 27 Nov 2026 09:30:49 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Yaohan Li <shunsheng1218@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, Mark Brown <broonie@kernel.org>,
	oe-kbuild@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	lkp@intel.com
Subject: Re: [broonie-regulator:for-7.5 6/6]
 drivers/regulator/qcom-labibb-regulator.c:444 qcom_labibb_setup_ocp_irq()
 warn: 'vreg->ocp_irq' from request_threaded_irq() not released on lines:
 444.
Message-ID: <awkjmRQl0B-ZJdpd@stanley.mountain>
References: <20261125184601.R647t8Sj-lkp@intel.com>
 <179567739729.2548149.711673218230357357@gmail.com>
 <awkf4CNhSPz-lcEk@stanley.mountain>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awkf4CNhSPz-lcEk@stanley.mountain>

I asked Claude to read my blog and re-write the file.  It fixes
the bug from earlier and two other bugs:

  - The "Short-circuit irq not found" message passed vreg->dev before it
     was set, so it printed without a device. It now uses dev.
  - The "error registering" message printed ret, which held the earlier
    regmap_read() result, not the registration error. It now prints
    PTR_ERR(vreg->rdev).

  Worth checking

  - The order inside qcom_labibb_stop() is deliberate: it disables the
    workers before the interrupt lines. The recovery workers are the
    only callers of enable_irq(). If the lines were disabled first, a
    worker still running could re-enable one afterwards.
  - The OCP worker is now initialized even without an OCP interrupt.
    That costs nothing and removes one condition to mirror. The worker
    can only be queued by the OCP handler.

regards,
dan carpenter

diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
index 49aaa31a539d..c6d066577150 100644
--- a/drivers/regulator/qcom-labibb-regulator.c
+++ b/drivers/regulator/qcom-labibb-regulator.c
@@ -96,14 +96,18 @@ struct labibb_regulator {
 	int				ocp_irq;
 	int				ocp_irq_count;
 	int				fatal_count;
-	bool				registered;
+	bool				started;
 	bool				ocp_requested;
-	bool				ocp_irq_done;
-	bool				shutting_down;
-	/* serialises the over-current request between set_ocp() and probe */
+	bool				ocp_enabled;
+	/* protects started, ocp_requested and ocp_enabled */
 	struct mutex			ocp_lock;
 };
 
+struct labibb_priv {
+	struct labibb_regulator		*vregs[2];
+	int				num_vregs;
+};
+
 struct labibb_regulator_data {
 	const char			*name;
 	u8				type;
@@ -314,134 +318,26 @@ static irqreturn_t qcom_labibb_ocp_isr(int irq, void *chip)
 }
 
 /*
- * Stop the recovery workers and release the over-current interrupt.  A
- * devres action is used instead of ->remove() so that a probe which fails
- * after the resources were set up goes through the same teardown: the
- * driver core does not call ->remove() for a failed probe, but devres
- * still releases what was registered.
- *
- * This is the only cleanup entry, and the over-current interrupt is
- * requested without devres so that it can be released here: registering a
- * second action from a path that runs under ocp_lock would also make
- * devm_add_action_or_reset() run this function from under that lock on
- * allocation failure.
- */
-static void qcom_labibb_stop_works(void *data)
-{
-	struct labibb_regulator *vreg = data;
-	int irq = 0;
-
-	/*
-	 * Announce the shutdown before anything is drained: a set_ocp()
-	 * that runs from here on must not request the over-current
-	 * interrupt while devres is releasing the action that would stop
-	 * its worker.
-	 */
-	mutex_lock(&vreg->ocp_lock);
-	vreg->shutting_down = true;
-	mutex_unlock(&vreg->ocp_lock);
-
-	/*
-	 * Both recovery workers reschedule themselves, so a plain cancel
-	 * would leave them queued again: disable_delayed_work_sync() also
-	 * blocks the requeue.
-	 */
-	disable_delayed_work_sync(&vreg->sc_recovery_work);
-	if (vreg->ocp_irq > 0) {
-		disable_delayed_work_sync(&vreg->ocp_recovery_work);
-
-		/*
-		 * The over-current handler turns the source off before it
-		 * queues the worker, but a handler that was stopped above
-		 * may have done so after the worker was drained: leave the
-		 * source off now that nobody would turn it back on.
-		 */
-		qcom_labibb_ocp_hw_disable(vreg->rdev);
-
-		mutex_lock(&vreg->ocp_lock);
-		if (vreg->ocp_irq_done) {
-			vreg->ocp_irq_done = false;
-			irq = vreg->ocp_irq;
-		}
-		mutex_unlock(&vreg->ocp_lock);
-
-		/*
-		 * A stopped handler can also have left the interrupt
-		 * disabled with disable_irq_nosync(), while the recovery
-		 * worker - the only caller of enable_irq() - is gone.  The
-		 * depth is deliberately not unwound here: free_irq() shuts
-		 * the line down regardless of it, whereas an enable_irq()
-		 * racing with a handler that is still running would unmask
-		 * a line whose thread has not finished.
-		 *
-		 * free_irq() waits for a running handler, so it is called
-		 * without ocp_lock held.
-		 */
-		if (irq)
-			free_irq(irq, vreg);
-	}
-}
-
-/*
- * Request the over-current interrupt once the regulator is registered.
- * Requesting it from ->set_over_current_protection() is not possible: the
- * regulator core calls that op from set_machine_constraints(), inside
- * regulator_register(), and a devres node created there is released after
- * the regulator itself.  The recovery worker would then still be runnable
- * while vreg->rdev is already gone.
+ * Turn on the over-current source and its interrupt line, once the
+ * protection was requested and the regulator is started.
  */
-static int qcom_labibb_setup_ocp_irq(struct labibb_regulator *vreg)
+static int qcom_labibb_ocp_arm(struct labibb_regulator *vreg)
 {
-	u32 irq_flags = IRQF_ONESHOT;
 	int ret;
 
 	lockdep_assert_held(&vreg->ocp_lock);
 
-	if (vreg->shutting_down)
-		return -ESHUTDOWN;
-
-	if (!vreg->ocp_requested)
+	if (!vreg->ocp_requested || vreg->ocp_enabled)
 		return 0;
 
-	if (!vreg->ocp_irq_done) {
-		/* IRQ polarities - LAB: trigger-low, IBB: trigger-high */
-		switch (vreg->type) {
-		case QCOM_LAB_TYPE:
-			irq_flags |= IRQF_TRIGGER_LOW;
-			break;
-		case QCOM_IBB_TYPE:
-			irq_flags |= IRQF_TRIGGER_HIGH;
-			break;
-		default:
-			return -EINVAL;
-		}
-
-		/*
-		 * The interrupt is owned and released by the cleanup
-		 * action, so its name has to outlive the interrupt:
-		 * devres would release a name allocated here before the
-		 * action runs, while vreg->desc.name is owned by the
-		 * driver data.
-		 */
-		ret = request_threaded_irq(vreg->ocp_irq, NULL,
-					   qcom_labibb_ocp_isr, irq_flags,
-					   vreg->desc.name, vreg);
-		if (ret)
-			return ret;
-
-		vreg->ocp_irq_done = true;
-	}
-
-	/*
-	 * Enable the hardware source only once a handler exists, and turn
-	 * it back off if that failed, so that a later attempt can retry
-	 * without leaving the source enabled on its own.
-	 */
 	ret = qcom_labibb_ocp_hw_enable(vreg->rdev);
 	if (ret)
-		qcom_labibb_ocp_hw_disable(vreg->rdev);
+		return ret;
 
-	return ret;
+	enable_irq(vreg->ocp_irq);
+	vreg->ocp_enabled = true;
+
+	return 0;
 }
 
 static int qcom_labibb_set_ocp(struct regulator_dev *rdev, int lim,
@@ -462,24 +358,10 @@ static int qcom_labibb_set_ocp(struct regulator_dev *rdev, int lim,
 		return -EINVAL;
 
 	/* IRQ polarities - LAB: trigger-low, IBB: trigger-high */
-	switch (vreg->type) {
-	case QCOM_LAB_TYPE:
-		irq_trig_low = 1;
-		break;
-	case QCOM_IBB_TYPE:
-		irq_trig_low = 0;
-		break;
-	default:
-		return -EINVAL;
-	}
+	irq_trig_low = vreg->type == QCOM_LAB_TYPE;
 
 	mutex_lock(&vreg->ocp_lock);
 
-	if (vreg->shutting_down) {
-		ret = -ESHUTDOWN;
-		goto unlock;
-	}
-
 	/* Activate OCP HW level interrupt */
 	ret = regmap_update_bits(rdev->regmap,
 				 vreg->base + REG_LABIBB_INT_SET_TYPE,
@@ -502,13 +384,9 @@ static int qcom_labibb_set_ocp(struct regulator_dev *rdev, int lim,
 
 	vreg->ocp_requested = true;
 
-	/*
-	 * During regulator_register() there is no interrupt yet and no
-	 * cleanup action to pair with it; the probe finishes the job once
-	 * the regulator and its devres nodes exist.
-	 */
-	if (vreg->registered)
-		ret = qcom_labibb_setup_ocp_irq(vreg);
+	/* During regulator_register() this waits for qcom_labibb_start() */
+	if (vreg->started)
+		ret = qcom_labibb_ocp_arm(vreg);
 
 unlock:
 	mutex_unlock(&vreg->ocp_lock);
@@ -899,153 +777,231 @@ static const struct of_device_id qcom_labibb_match[] = {
 };
 MODULE_DEVICE_TABLE(of, qcom_labibb_match);
 
-static int qcom_labibb_regulator_probe(struct platform_device *pdev)
+/* Turn on the interrupts and, if it was requested, over-current protection */
+static int qcom_labibb_start(struct labibb_regulator *vreg)
+{
+	int ret;
+
+	mutex_lock(&vreg->ocp_lock);
+	ret = qcom_labibb_ocp_arm(vreg);
+	if (ret)
+		goto unlock;
+
+	vreg->started = true;
+	enable_irq(vreg->sc_irq);
+unlock:
+	mutex_unlock(&vreg->ocp_lock);
+	return ret;
+}
+
+static void qcom_labibb_stop(struct labibb_regulator *vreg)
+{
+	bool ocp_enabled;
+
+	mutex_lock(&vreg->ocp_lock);
+	vreg->started = false;
+	ocp_enabled = vreg->ocp_enabled;
+	vreg->ocp_enabled = false;
+	mutex_unlock(&vreg->ocp_lock);
+
+	/* The workers requeue themselves, so cancel_delayed_work_sync() isn't enough */
+	disable_delayed_work_sync(&vreg->sc_recovery_work);
+	disable_irq(vreg->sc_irq);
+
+	if (ocp_enabled) {
+		disable_delayed_work_sync(&vreg->ocp_recovery_work);
+		disable_irq(vreg->ocp_irq);
+		qcom_labibb_ocp_hw_disable(vreg->rdev);
+	}
+}
+
+static int qcom_labibb_setup_vreg(struct device *dev, struct regmap *regmap,
+				  const struct labibb_regulator_data *reg_data,
+				  struct labibb_regulator **result)
 {
-	struct labibb_regulator *vreg;
-	struct device *dev = &pdev->dev;
 	struct regulator_config cfg = {};
+	struct labibb_regulator *vreg;
 	struct device_node *reg_node;
-	const struct labibb_regulator_data *reg_data;
-	struct regmap *reg_regmap;
+	unsigned long ocp_irq_flags;
+	char *sc_irq_name;
 	unsigned int type;
 	int ret;
 
-	reg_regmap = dev_get_regmap(pdev->dev.parent, NULL);
-	if (!reg_regmap) {
-		dev_err(&pdev->dev, "Couldn't get parent's regmap\n");
-		return -ENODEV;
+	/* Validate if the type of regulator is indeed what's mentioned in DT */
+	ret = regmap_read(regmap, reg_data->base + REG_PERPH_TYPE, &type);
+	if (ret < 0) {
+		dev_err(dev, "Peripheral type read failed ret=%d\n", ret);
+		return -EINVAL;
 	}
 
-	reg_data = device_get_match_data(&pdev->dev);
-	if (!reg_data)
-		return -ENODEV;
+	if (WARN_ON((type != QCOM_LAB_TYPE) && (type != QCOM_IBB_TYPE)) ||
+	    WARN_ON(type != reg_data->type))
+		return -EINVAL;
 
-	for (; reg_data->name; reg_data++) {
-		char *sc_irq_name;
-		int irq = 0;
+	vreg = devm_kzalloc_obj(dev, *vreg);
+	if (!vreg)
+		return -ENOMEM;
 
-		/* Validate if the type of regulator is indeed
-		 * what's mentioned in DT.
-		 */
-		ret = regmap_read(reg_regmap, reg_data->base + REG_PERPH_TYPE,
-				  &type);
-		if (ret < 0) {
-			dev_err(dev,
-				"Peripheral type read failed ret=%d\n",
-				ret);
-			return -EINVAL;
-		}
+	sc_irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s-short-circuit",
+				     reg_data->name);
+	if (!sc_irq_name)
+		return -ENOMEM;
 
-		if (WARN_ON((type != QCOM_LAB_TYPE) && (type != QCOM_IBB_TYPE)) ||
-		    WARN_ON(type != reg_data->type))
-			return -EINVAL;
-
-		vreg = devm_kzalloc_obj(&pdev->dev, *vreg);
-		if (!vreg)
-			return -ENOMEM;
-
-		sc_irq_name = devm_kasprintf(dev, GFP_KERNEL,
-					     "%s-short-circuit",
-					     reg_data->name);
-		if (!sc_irq_name)
-			return -ENOMEM;
-
-		reg_node = of_get_child_by_name(pdev->dev.of_node,
-						reg_data->name);
-		if (!reg_node)
-			return -EINVAL;
-
-		/* The Short Circuit interrupt is critical */
-		irq = of_irq_get_byname(reg_node, "sc-err");
-		if (irq <= 0) {
-			if (irq == 0)
-				irq = -EINVAL;
-
-			of_node_put(reg_node);
-			return dev_err_probe(vreg->dev, irq,
-					     "Short-circuit irq not found.\n");
-		}
-		vreg->sc_irq = irq;
+	reg_node = of_get_child_by_name(dev->of_node, reg_data->name);
+	if (!reg_node)
+		return -EINVAL;
 
-		/* OverCurrent Protection IRQ is optional */
-		irq = of_irq_get_byname(reg_node, "ocp");
-		vreg->ocp_irq = irq;
-		vreg->ocp_irq_count = 0;
-		of_node_put(reg_node);
-
-		vreg->regmap = reg_regmap;
-		vreg->dev = dev;
-		vreg->base = reg_data->base;
-		vreg->type = reg_data->type;
-		mutex_init(&vreg->ocp_lock);
-		INIT_DELAYED_WORK(&vreg->sc_recovery_work,
-				  qcom_labibb_sc_recovery_worker);
-
-		if (vreg->ocp_irq > 0)
-			INIT_DELAYED_WORK(&vreg->ocp_recovery_work,
-					  qcom_labibb_ocp_recovery_worker);
-
-		switch (vreg->type) {
-		case QCOM_LAB_TYPE:
-			/* LAB Limits: 200-1600mA */
-			vreg->uA_limits.uA_min  = 200000;
-			vreg->uA_limits.uA_step = 200000;
-			vreg->uA_limits.ovr_val = LAB_CURRENT_LIMIT_OVERRIDE_EN;
-			break;
-		case QCOM_IBB_TYPE:
-			/* IBB Limits: 0-1550mA */
-			vreg->uA_limits.uA_min  = 0;
-			vreg->uA_limits.uA_step = 50000;
-			vreg->uA_limits.ovr_val = 0; /* No override bit */
-			break;
-		default:
-			return -EINVAL;
-		}
+	/* The Short Circuit interrupt is critical */
+	vreg->sc_irq = of_irq_get_byname(reg_node, "sc-err");
+	/* OverCurrent Protection IRQ is optional */
+	vreg->ocp_irq = of_irq_get_byname(reg_node, "ocp");
+	of_node_put(reg_node);
 
-		memcpy(&vreg->desc, reg_data->desc, sizeof(vreg->desc));
-		vreg->desc.of_match = reg_data->name;
-		vreg->desc.name = reg_data->name;
+	if (vreg->sc_irq <= 0) {
+		ret = vreg->sc_irq ?: -EINVAL;
+		return dev_err_probe(dev, ret, "Short-circuit irq not found.\n");
+	}
 
-		cfg.dev = vreg->dev;
-		cfg.driver_data = vreg;
-		cfg.regmap = vreg->regmap;
+	vreg->regmap = regmap;
+	vreg->dev = dev;
+	vreg->base = reg_data->base;
+	vreg->type = reg_data->type;
+	mutex_init(&vreg->ocp_lock);
+	INIT_DELAYED_WORK(&vreg->sc_recovery_work,
+			  qcom_labibb_sc_recovery_worker);
+	INIT_DELAYED_WORK(&vreg->ocp_recovery_work,
+			  qcom_labibb_ocp_recovery_worker);
+
+	if (vreg->type == QCOM_LAB_TYPE) {
+		/* LAB Limits: 200-1600mA */
+		vreg->uA_limits.uA_min  = 200000;
+		vreg->uA_limits.uA_step = 200000;
+		vreg->uA_limits.ovr_val = LAB_CURRENT_LIMIT_OVERRIDE_EN;
+		/* IRQ polarities - LAB: trigger-low, IBB: trigger-high */
+		ocp_irq_flags = IRQF_TRIGGER_LOW;
+	} else {
+		/* IBB Limits: 0-1550mA */
+		vreg->uA_limits.uA_min  = 0;
+		vreg->uA_limits.uA_step = 50000;
+		vreg->uA_limits.ovr_val = 0; /* No override bit */
+		ocp_irq_flags = IRQF_TRIGGER_HIGH;
+	}
 
-		vreg->rdev = devm_regulator_register(vreg->dev, &vreg->desc,
-							&cfg);
+	memcpy(&vreg->desc, reg_data->desc, sizeof(vreg->desc));
+	vreg->desc.of_match = reg_data->name;
+	vreg->desc.name = reg_data->name;
 
-		if (IS_ERR(vreg->rdev)) {
-			dev_err(dev, "qcom_labibb: error registering %s : %d\n",
-					reg_data->name, ret);
-			return PTR_ERR(vreg->rdev);
-		}
+	/* The handlers use vreg->rdev, so qcom_labibb_start() enables them */
+	ret = request_threaded_irq(vreg->sc_irq, NULL, qcom_labibb_sc_isr,
+				   IRQF_ONESHOT | IRQF_TRIGGER_RISING |
+				   IRQF_NO_AUTOEN,
+				   sc_irq_name, vreg);
+	if (ret)
+		goto destroy_mutex;
 
-		ret = devm_request_threaded_irq(vreg->dev, vreg->sc_irq, NULL,
-						qcom_labibb_sc_isr,
-						IRQF_ONESHOT |
-						IRQF_TRIGGER_RISING,
-						sc_irq_name, vreg);
+	if (vreg->ocp_irq > 0) {
+		ret = request_threaded_irq(vreg->ocp_irq, NULL,
+					   qcom_labibb_ocp_isr,
+					   IRQF_ONESHOT | ocp_irq_flags |
+					   IRQF_NO_AUTOEN,
+					   vreg->desc.name, vreg);
 		if (ret)
-			return ret;
+			goto free_sc_irq;
+	}
 
-		ret = devm_add_action_or_reset(vreg->dev,
-					       qcom_labibb_stop_works, vreg);
-		if (ret)
-			return ret;
+	cfg.dev = dev;
+	cfg.driver_data = vreg;
+	cfg.regmap = vreg->regmap;
 
-		/*
-		 * Publish the registration only now: a concurrent
-		 * set_ocp() must not be able to request the over-current
-		 * interrupt before the action that stops its worker exists.
-		 */
-		mutex_lock(&vreg->ocp_lock);
-		vreg->registered = true;
-		ret = qcom_labibb_setup_ocp_irq(vreg);
-		mutex_unlock(&vreg->ocp_lock);
+	vreg->rdev = regulator_register(dev, &vreg->desc, &cfg);
+	if (IS_ERR(vreg->rdev)) {
+		ret = PTR_ERR(vreg->rdev);
+		dev_err(dev, "qcom_labibb: error registering %s : %d\n",
+			reg_data->name, ret);
+		goto free_ocp_irq;
+	}
+
+	ret = qcom_labibb_start(vreg);
+	if (ret)
+		goto unregister;
+
+	*result = vreg;
+	return 0;
+
+unregister:
+	regulator_unregister(vreg->rdev);
+free_ocp_irq:
+	if (vreg->ocp_irq > 0)
+		free_irq(vreg->ocp_irq, vreg);
+free_sc_irq:
+	free_irq(vreg->sc_irq, vreg);
+destroy_mutex:
+	mutex_destroy(&vreg->ocp_lock);
+	return ret;
+}
+
+static void qcom_labibb_cleanup_vreg(struct labibb_regulator *vreg)
+{
+	qcom_labibb_stop(vreg);
+	regulator_unregister(vreg->rdev);
+	if (vreg->ocp_irq > 0)
+		free_irq(vreg->ocp_irq, vreg);
+	free_irq(vreg->sc_irq, vreg);
+	mutex_destroy(&vreg->ocp_lock);
+}
+
+static int qcom_labibb_regulator_probe(struct platform_device *pdev)
+{
+	const struct labibb_regulator_data *reg_data;
+	struct device *dev = &pdev->dev;
+	struct labibb_priv *priv;
+	struct regmap *reg_regmap;
+	int i, ret;
+
+	reg_regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!reg_regmap) {
+		dev_err(&pdev->dev, "Couldn't get parent's regmap\n");
+		return -ENODEV;
+	}
+
+	reg_data = device_get_match_data(&pdev->dev);
+	if (!reg_data)
+		return -ENODEV;
+
+	priv = devm_kzalloc_obj(dev, *priv);
+	if (!priv)
+		return -ENOMEM;
+
+	for (i = 0; reg_data[i].name; i++) {
+		if (i >= ARRAY_SIZE(priv->vregs)) {
+			ret = -EINVAL;
+			goto cleanup_vregs;
+		}
+
+		ret = qcom_labibb_setup_vreg(dev, reg_regmap, &reg_data[i],
+					     &priv->vregs[i]);
 		if (ret)
-			return ret;
+			goto cleanup_vregs;
 	}
 
+	priv->num_vregs = i;
+	platform_set_drvdata(pdev, priv);
+
 	return 0;
+
+cleanup_vregs:
+	while (--i >= 0)
+		qcom_labibb_cleanup_vreg(priv->vregs[i]);
+	return ret;
+}
+
+static void qcom_labibb_regulator_remove(struct platform_device *pdev)
+{
+	struct labibb_priv *priv = platform_get_drvdata(pdev);
+	int i;
+
+	for (i = priv->num_vregs - 1; i >= 0; i--)
+		qcom_labibb_cleanup_vreg(priv->vregs[i]);
 }
 
 static struct platform_driver qcom_labibb_regulator_driver = {
@@ -1055,6 +1011,7 @@ static struct platform_driver qcom_labibb_regulator_driver = {
 		.of_match_table	= qcom_labibb_match,
 	},
 	.probe = qcom_labibb_regulator_probe,
+	.remove = qcom_labibb_regulator_remove,
 };
 module_platform_driver(qcom_labibb_regulator_driver);
 

