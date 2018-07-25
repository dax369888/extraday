package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id ="2016091600525947";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key ="MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCCzWKEQx2czfnniAoAjh8rrYr6T/+eIgYPka0vsZ2zUV2pq5SnDz5JEBv2S8iCAjrDRqec1aUoy1VioLE76lr7RU8vJUFJcCEcRpOy9yqr/dgZm2ZrbVTif9R+ZURwCa6F/+wbDfVweAvNyYkaZnLznCBSUPNE7Vj0yWAnxW2u8hBId0/3h1HI4dMA4kzWn3cg0Qn6fAINPnhdvtBtD1At8HHdPrnvQBUQBCtmL4Mi4halHN/VOuYV99IfafOHSSPX6RCQPauzpjhYjbhyPBY4PITb65RmFskzOaOWgqC1tG5FVij1nmDk9FMMDVteQ6z/+NGnVGnbK+7I4hox2gDXAgMBAAECggEATMbJgOD0TMoKWgDb/h9t5HFlFjBG1kcaT6EuisQy0MJ9u83e34BvCuvNvfAVrVopq92ZHNG6tAtF/zJbVdPlu3+fTwkLHVQX20UCBRZXkcTaR42TvJLcNGbcD6TZWvoT2suxht/WpUGRjCUzuK9R4fROdILXiCnZATYCntWf4AOV6FgmFdwMsfVnHbwgDWNCyWlD1NcVUaVNcVn7J5+u5eime8fyQRLKvF5TQhA3LS+04rhJD/CR1qJNQR6zOcJqr8nLvNKGdBmPxiHVo+NRjNtJxhYrWVbt+u2W6QFe7rEyx59GUjeq0YRtCHh37BGKyDso3melqxsTHw/BbtPLgQKBgQDKbtSP92IH2v5+ajKYES8sw3D+8r4qC6wIEbW7HEyjdgshPFYM26j5p0y1bJQN251swF4QFHecF237jGz6UH3F4LU79rQqDGZYzRS9TR1yzHHgoVp6O28pPvRvz9EoE5siRznvs0ejdApnXy1ne+BEWxZkAE9kn7lhJy3E8K8J0QKBgQClaiqFIaU7WuGKLfGNC3qrwtk09/airrAgIMGGz3oldDSPBZgqQumunuFcylWgePlsTnGW+NbegosyTxUCNViUp3J4KMnS9WCyKRpMAO/2+oUYA7sf+RL1k6vBS38HEulYZFDIyB2HGkyAmwec986qn0E9YXxolaf2vOrERHXiJwKBgQCGBLH9Tg48nSN3ld9BBb9xp0KbxyFWvLt77B2gbq/eWDwuGL/va02HWtdSFTw/oHGsmf6sLqCxWmGZ8/ICFl/uLUJPHJlSbTsk90EPwooIgomx6aD443hImkFB9RfHrJM8MmOM6eg3so9guIZayIxFNPix4/Kr74LPaxzGEYIQwQKBgE/v8WJq8wWvEqWLNFs7++k7fWo6lobhsp2kFsIGS/oDoU6onnN16KYJg9EqupyVObwcYIpb8MKRBaGnU/jAPPGBxjDJTVdUW4ldkaa/ITgSsvT7AJgf7wicd3ku+dE6U2fy+pM9Gf/rNqNDyDcUDlyoH4gBL3T/Na9odm+owesrAoGBAMnuaJjfVMP2F0dJ3cWAXPxHomOQFm0/Glq1raTn051Ne1qQeA6r5L9MP1D4tdAwdy+yB6UYnvIshIsMKFQs5KPaDLN6NZc6zLAh0iyRa6V/0Nk9AfBFUE6bz6TqYCOpYtwyAIYtvPiHgMLGxgVqMvsATL9vRxCBK7T/ZIMssp+6";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key ="MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAgs1ihEMdnM3554gKAI4fK62K+k//niIGD5GtL7Gds1FdqauUpw8+SRAb9kvIggI6w0annNWlKMtVYqCxO+pa+0VPLyVBSXAhHEaTsvcqq/3YGZtma21U4n/UfmVEcAmuhf/sGw31cHgLzcmJGmZy85wgUlDzRO1Y9MlgJ8VtrvIQSHdP94dRyOHTAOJM1p93INEJ+nwCDT54Xb7QbQ9QLfBx3T6570AVEAQrZi+DIuIWpRzf1TrmFffSH2nzh0kj1+kQkD2rs6Y4WI24cjwWODyE2+uUZhbJMzmjloKgtbRuRVYo9Z5g5PRTDA1bXkOs//jRp1Rp2yvuyOIaMdoA1wIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url ="http://127.0.0.1:8080/extraday/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url ="http://127.0.0.1:8080/extraday/paySuccess.jsp";

	// 签名方式
	public static String sign_type ="RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl ="https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

