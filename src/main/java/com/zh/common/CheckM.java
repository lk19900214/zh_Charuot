package com.zh.common;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

/**
 * Created by webrx on 2017-09-27.
 */
@WebServlet("/checkm.do")
public class CheckM extends HttpServlet {

    @Override
    public void service(ServletRequest req, ServletResponse res)
            throws ServletException, IOException {
        // 定义图片宽高

        int h = 35;
        int len = 4;
        int w = len*25;
        Random r = new Random();
        HttpServletRequest request = (HttpServletRequest)req;
        // 实例化缓冲图片

        BufferedImage image = new BufferedImage(w, h,BufferedImage.TYPE_INT_RGB);
        // 获取画笔队像

        //Graphics g = image.getGraphics();

        Graphics2D graphics = (Graphics2D) image.getGraphics();
        // 设置背景颜色

        graphics.setColor(Color.WHITE);
        graphics.fillRect(0, 0, w, h);

        //设置文字

        String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        StringBuilder checknum = new StringBuilder(len);
        for(int i=0;i<len;i++){
            graphics.setColor(this.getColor(r.nextInt(100)+155));
            //获得随机字母或数字

            int temp = r.nextInt(str.length());
            String nwes = str.substring(temp, temp+1);
            checknum.append(nwes);
            //显示文字横纵坐标

            int x = i * 25+5;
            int y = r.nextInt(10)+20;
            //设置字体大小   --字体类型  字体样式   大小

            graphics.setFont(new Font("宋体",Font.BOLD,r.nextInt(10)+15));
            //显示文字

            graphics.drawString(nwes, x, y);
        }

        //获取值

        HttpSession session = request.getSession();
        session.setAttribute("checkM", checknum.toString());
        //System.out.println(checknum.toString());


        //干扰文字

        for(int i=0;i<50;i++){
            graphics.setColor(this.getColor(r.nextInt(50)+10));
            //获得随机字母或数字

            int temp = r.nextInt(str.length());
            String nwes = str.substring(temp, temp+1);
            checknum.append(nwes);
            int x = r.nextInt(w);
            int y = r.nextInt(h);
            //设置字体大小   --字体类型  字体样式   大小

            graphics.setFont(new Font("宋体",Font.BOLD,r.nextInt(10)+5));
            //显示文字

            graphics.drawString(nwes, x, y);
        }
        // 干扰 值线

        for (int n = 0; n <= 20; n++) {
            graphics.setColor(this.getColor(r.nextInt(30) + 10));
            graphics.setStroke(new BasicStroke(r.nextFloat() * 5 + 1f));
            int xx = r.nextInt(w);
            int yy = r.nextInt(h);
            int x = r.nextInt(w);
            int y = r.nextInt(h);
            graphics.drawLine(x, y, xx, yy);
        }
        // 曲线

        graphics.setColor(this.getColor(r.nextInt(30) + 10));
        int xx = r.nextInt(w - 5) + 5;
        int swh = r.nextInt(10) + 2;
        int sy = r.nextInt(h - 10) + 10;
        int ppp = r.nextInt(40) + 10;
        for (int m = 0; m <= w; m++) {
            graphics.setStroke(new BasicStroke(r.nextFloat() * 20 + 1f));
            int x = m;
            double y = sy + Math.sin(m * Math.PI / ppp) * 10;
            graphics.fillOval((int) x, (int) y, swh, swh);
        }

        graphics.dispose();


        // 输出(在页面显示)

        ImageIO.write(image, "png", res.getOutputStream());
    }



    /**
     * <p>返回一个随机颜色，随机透明度的Color对象
     * @return
     */
    public Color getColor() {
        Random r = new Random();
        return new Color(r.nextInt(255), r.nextInt(255), r.nextInt(255), r.nextInt(255));
    }

    /**
     * <p>功能：返回有透明度的随机颜色，alpha是透明度0-255 0完全透明 255不透明纯色</p>
     * @param alpha
     * @return
     */
    public Color getColor(int alpha) {
        Random r = new Random();
        return new Color(r.nextInt(255), r.nextInt(255), r.nextInt(255), alpha);
    }

}
