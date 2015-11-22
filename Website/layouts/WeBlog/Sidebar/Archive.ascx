﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BlogArchive.ascx.cs" Inherits="Sitecore.Modules.WeBlog.Layouts.BlogArchive" %>

<div class="wb-archive wb-panel" id="wb-archive">
    <h3><%=Sitecore.Modules.WeBlog.Globalization.Translator.Render("ARCHIVE")%></h3>
    <asp:Repeater runat="server" ID="Years" ItemType="System.Int32">
        <HeaderTemplate>
            <ul>
        </HeaderTemplate>
        <ItemTemplate>
            <li>
                <a class="wb-year <%# ExpandMonthsOnLoad ? "expanded" : "" %>"><%# Item %></a>
                <asp:Repeater runat="server" ID="Months" DataSource="<%# GetMonths(Item) %>" OnItemDataBound="MonthDataBound" ItemType="System.Object">
                    <HeaderTemplate>
                        <ul id="month-<%# (Container.Parent.Parent as RepeaterItem).DataItem %>" class="wb-month" <% if(!ExpandMonthsOnLoad) { %>style="display:none;"<% } %>>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li>
                            <a class="wb-month <%# ExpandPostsOnLoad ? "expanded" : "" %>"><%# GetFriendlyMonthName((int)Item) %> (<%# GetEntryCountForYearAndMonth((int)Item)%>)</a>
                            <asp:Repeater runat="server" ID="Entries" DataSource="<%# GetEntriesForYearAndMonth((int)Item) %>" ItemType="Sitecore.Modules.WeBlog.Data.Items.EntryItem">
                                <HeaderTemplate>
                                    <ul id="entries-<%# (Container.Parent.Parent as RepeaterItem).DataItem %>" class="wb-entries" <% if(!ExpandPostsOnLoad) { %>style="display:none;" <% } %>>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <li>
                                        <a href="<%# Item.Url %>"><%# Item.Title.Rendered %></a>
                                    </li>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </ul>
                                </FooterTemplate>
                            </asp:Repeater>
                        </li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul>
                    </FooterTemplate>
                </asp:Repeater>
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
        </FooterTemplate>
    </asp:Repeater>
</div>
